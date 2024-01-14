import 'package:flutter/material.dart';

class NavBar extends StatelessWidget {
  const NavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          UserAccountsDrawerHeader(
            accountName: Text("Tadesse Shefera"),
            accountEmail: Text("tadess1127@gmail.com"),
            currentAccountPicture: CircleAvatar(
              child: ClipOval(
                child: Image.asset("assets/images/tad.jpeg"),
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text("setting"),
            onTap: () => print("setting clicked"),
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text("setting"),
            onTap: () => print("setting clicked"),
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text("setting"),
            onTap: () => print("setting clicked"),
          ),
          ListTile(
            leading: Icon(Icons.help),
            title: Text("Help"),
            onTap: () => print("setting clicked"),
          ),
          ListTile(
            leading: Icon(Icons.person),
            title: Text("About Developer"),
            onTap: () => print("About developer clicked"),
          )
        ],
      ),
    );
  }
}
