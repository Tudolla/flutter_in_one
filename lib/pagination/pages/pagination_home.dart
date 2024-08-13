import 'package:dio/dio.dart';
import 'package:dummy/pagination/model/product.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class PaginationScreen extends StatefulWidget {
  const PaginationScreen({super.key});

  @override
  State<PaginationScreen> createState() => _PaginationScreenState();
}

class _PaginationScreenState extends State<PaginationScreen> {
  final Dio dio = Dio();
  List<Product> products = [];
  int? totalProduct;
  final ScrollController _scrollController = ScrollController();

  bool isLoading = false;
  @override
  void initState() {
    super.initState();
    getProducts();
    _scrollController.addListener(loadMoteData);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Pagination"),
        centerTitle: true,
      ),
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: ListView.builder(
            physics: const AlwaysScrollableScrollPhysics(),
            shrinkWrap: true,
            controller: _scrollController,
            itemCount: products.length,
            itemBuilder: (context, index) {
              final product = products[index];

              return Column(
                children: [
                  ListTile(
                    leading: Text(
                      product.id.toString(),
                    ),
                    title: Text(
                      product.title!,
                    ),
                    subtitle: Text(
                      "\$ ${product.price}",
                    ),
                    trailing: Image(
                      image: NetworkImage(product.thumbnail!),
                    ),
                  ),
                  if (index == products.length - 1 && isLoading)
                    const Padding(
                      padding: EdgeInsets.all(10),
                      child: SpinKitThreeBounce(
                        color: Colors.blueGrey,
                        size: 40,
                      ),
                    )
                ],
              );
            }),
      ),
    );
  }

  void loadMoteData() {
    if (_scrollController.position.pixels ==
            _scrollController.position.maxScrollExtent &&
        products.length < totalProduct!) {
      getProducts();
    }
  }

  Future<void> getProducts() async {
    try {
      setState(() {
        isLoading = true;
      });
      // explain this api url:
      // baseURL : https://dummyjson.com/products
      // limit   : get only 15 item in the first time
      // skip    : this is main in pagination - skip 15 item before, and continute get more 15 item
      // in the next
      // select : get only title, price, thumbnail
      final response = await dio.get(
          "https://dummyjson.com/products?limit=15&skip=${products.length}&select=title,price,thumbnail");
      final List<dynamic> data = response.data['products'];

      final List<Product> newProducts =
          data.map((e) => Product.fromJson(e)).toList();

      setState(() {
        totalProduct = response.data['total'];
        products.addAll(newProducts);
        isLoading = false;
      });

      // print(newProducts);
    } catch (e) {
      // print(e);
    }
  }
}
