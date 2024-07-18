import 'package:flutter/material.dart';

class DrawerScreen extends StatefulWidget {
  const DrawerScreen({super.key});

  @override
  State<DrawerScreen> createState() => _DrawerScreenState();
}

class _DrawerScreenState extends State<DrawerScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blueGrey,
      child: Padding(
        padding: const EdgeInsets.only(
          top: 40,
          left: 20,
          bottom: 60,
        ),
        child: Column(
          children: [
            Row(
              children: [
                CircleAvatar(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.asset("images/avatar.png"),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                const Text(
                  "MonstarLab",
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              margin:
                  EdgeInsets.only(right: MediaQuery.of(context).size.width / 2),
              child: Divider(
                color: Colors.white,
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            const Column(
              children: [
                ListTile(
                  contentPadding: EdgeInsets.only(left: 10),
                  minLeadingWidth: 1,
                  leading: Icon(Icons.home),
                  title: Text("Home"),
                ),
                ListTile(
                  contentPadding: EdgeInsets.only(left: 10),
                  minLeadingWidth: 1,
                  leading: Icon(Icons.integration_instructions_rounded),
                  title: Text("Introduction"),
                ),
                ListTile(
                  contentPadding: EdgeInsets.only(left: 10),
                  minLeadingWidth: 1,
                  leading: Icon(Icons.group_add),
                  title: Text("Team"),
                ),
                ListTile(
                  contentPadding: EdgeInsets.only(left: 8),
                  minLeadingWidth: 1,
                  leading: Icon(Icons.person_2_rounded),
                  title: Text("About us!"),
                ),
                ListTile(
                  contentPadding: EdgeInsets.only(left: 8),
                  minLeadingWidth: 1,
                  leading: Icon(Icons.login_outlined),
                  title: Text("Logout"),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
