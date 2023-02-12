
import 'package:flutter/material.dart';
class CustomDrawer extends StatelessWidget {
  const CustomDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.black54,
      child: SingleChildScrollView(
        child: Column(
          children: [
            Divider(height: 40,),
            ListTile(title: Text("Login"),),
            ListTile(title: Text("About"),),
            ListTile(title: Text("Logout"),),
            ListTile(title: Text("About"),),
          ],
        ),
      ),
    );
  }
}
