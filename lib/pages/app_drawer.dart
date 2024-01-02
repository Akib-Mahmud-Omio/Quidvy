import 'package:flutter/material.dart';
import 'package:quidvy/pages/help.dart';
import 'package:quidvy/pages/about_us.dart';


class app_drawer extends StatefulWidget {
  const app_drawer({Key? key}) : super(key: key);

  @override
  State<app_drawer> createState() => _app_drawerstate();
}
class _app_drawerstate extends State<app_drawer>{

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
          padding: EdgeInsets.zero,
          children: [
      DrawerHeader(
      decoration: BoxDecoration(
      color: Colors.deepOrange
      ),
      child: Column(
        children: [
          CircleAvatar(
            radius: 40,
            backgroundImage: AssetImage('assets/profile_pic.jpg'),
          ),
          SizedBox(height: 10),
          Text(
            'User Name',
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
            ),
          ),
        ],
      ),
    ),
            ListTile(
              leading: Icon(Icons.notifications),
              title: Text('Notifications'),
              onTap: () {
                print('Notifications button tapped');
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.dark_mode),
              title: Text('Dark Mode'),
              onTap: () {
                print('Dark Mode button tapped');
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.info),
              title: Text('About Us'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AboutUs()),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.help),
              title: Text('Help'),
              onTap: () {Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Help()),
              );
              },
            ),
            ListTile(
              leading: Icon(Icons.exit_to_app),
              title: Text('Logout'),
              onTap: () {
                print('Logout button tapped');
                Navigator.pop(context);
              },
            ),
          ],
      ),
    );

  }
}