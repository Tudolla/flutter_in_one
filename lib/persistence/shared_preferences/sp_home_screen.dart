import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:input_quantity/input_quantity.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefrenceScreen extends StatefulWidget {
  const SharedPrefrenceScreen({super.key});

  @override
  State<SharedPrefrenceScreen> createState() => _SharedPrefrenceScreenState();
}

class _SharedPrefrenceScreenState extends State<SharedPrefrenceScreen> {
  late SharedPreferences? _prefs;

  num _height = 0, _weight = 0;

  List<String> _bmiStore = [];

  @override
  void initState() {
    super.initState();
    SharedPreferences.getInstance().then((value) {
      setState(() {
        _prefs = value;
        _height = _prefs!.getDouble("last_input_height") ?? 0;
        _weight = _prefs!.getDouble("last_input_weight ") ?? 0;
        _bmiStore = _prefs!.getStringList("bmi_history") ?? [];
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Shared Preferences"),
        centerTitle: true,
      ),
      body: _buildHomeScreen(),
    );
  }

  Widget _buildHomeScreen() {
    if (_prefs == null) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }
    return SafeArea(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      // crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      children: [
        Container(
          padding: const EdgeInsets.all(10),
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height * 0.1,
          child: Center(
            child: Text(
              "${_bmiStore.lastOrNull ?? 0.00} BMI",
            ),
          ),
        ),
        Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _weightInput(),
            _heightInput(),
          ],
        ),
        _widgetCalculateButton(),
        _bmiHistoryList(),
      ],
    ));
  }

  Widget _widgetCalculateButton() {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 15,
      ),
      child: MaterialButton(
        color: Colors.blueGrey,
        elevation: 10,
        onPressed: () {
          double res = _weight / (_height * _height);
          // print(res);
          setState(() {
            _bmiStore.add(res.toStringAsFixed(2));
            _prefs!.setStringList("bmi_history", _bmiStore);
          });
        },
        child: const Text(
          "Caculate",
          style: TextStyle(
            fontSize: 25,
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  Widget _weightInput() {
    return Column(
      children: [
        const Text("Weight Input"),
        InputQty(
          maxVal: double.infinity,
          minVal: 0,
          initVal: _weight,
          steps: 1,
          onQtyChanged: (value) {
            setState(() {
              _weight = value;
              _prefs!.setDouble("last_input_weight", _weight.toDouble());
            });
          },
        ),
      ],
    );
  }

  Widget _heightInput() {
    return Column(
      children: [
        const Text("Height Input"),
        InputQty(
          initVal: _height,
          maxVal: double.infinity,
          minVal: 0,
          steps: 1,
          onQtyChanged: (value) {
            _height = value;
            _prefs!.setDouble("last_input_height", _height.toDouble());
          },
        ),
      ],
    );
  }

  Widget _bmiHistoryList() {
    return Expanded(
        child: ListView.builder(
            itemCount: _bmiStore.length,
            itemBuilder: (context, index) {
              return ListTile(
                leading: Text(DateFormat("dd-MM-yyy").format(DateTime.now())),
                title: const Text("Your BMI:"),
                subtitle: Text(_bmiStore[index]),
                trailing: GestureDetector(
                  onTap: () {
                    setState(() {
                      _bmiStore.removeAt(index);
                    });
                  },
                  child: const Icon(
                    Icons.delete,
                    color: Colors.redAccent,
                  ),
                ),
              );
            }));
  }
}
