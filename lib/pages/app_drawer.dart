import 'package:flutter/material.dart';
import 'package:quidvy/pages/help.dart';
import 'package:quidvy/pages/about_us.dart';
import 'package:quidvy/pages/interest_calculator.dart';
import 'package:quidvy/pages/currency.dart';
import 'package:quidvy/pages/compound_calculator.dart';
import 'package:quidvy/pages/resource.dart';
import 'package:quidvy/pages/goals.dart';
import 'package:quidvy/pages/student_money.dart';
import 'package:quidvy/pages/loan.dart';

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
              leading: Icon(Icons.calculate),
              title: Text('Money Management'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => student()),
                );
              },
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
              leading: Icon(Icons.calculate),
              title: Text('Loan Management'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LoanDetailsScreen()),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.calculate),
              title: Text('IntCalculator'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => InterestCalculator()),
                );
              },
            ),
            /*ListTile(
              leading: Icon(Icons.calculate),
              title: Text('CuConverter'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CurrencyConverter()),
                );
              },
            ),*/
            ListTile(
              leading: Icon(Icons.calculate),
              title: Text('CmpCalculator'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CompoundInterestCalculator()),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.calculate),
              title: Text('Savings Goals'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => GoalScreen()),
                );
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
              leading: Icon(Icons.tips_and_updates_outlined),
              title: Text('Finance Tips'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => EducationalResourcesScreen()),
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