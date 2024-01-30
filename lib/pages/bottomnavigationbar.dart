import 'package:flutter/material.dart';
import 'package:quidvy/pages/app_drawer.dart';
import 'package:quidvy/pages/homepage.dart';
import 'package:quidvy/pages/statistics.dart';
import 'package:quidvy/pages/add_screen.dart';
import 'package:quidvy/pages/card.dart';

class Bottom extends StatefulWidget {
  const Bottom({Key? key}) : super(key: key);

  @override
  State<Bottom> createState() => _BottomState();
}

class _BottomState extends State<Bottom> {
  int index = 2;
  List Screen = [app_drawer(), Statistics(), Home(userEmail: 'akibmahmudomio@gmail.com'), Statistics()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Screen[index],
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddScreen(userEmail: 'akibmahmudomio@gmail.com',)),
          );
        },
        child: Icon(Icons.add,
          size: 30,
        ),
        backgroundColor: Color(0xfff25a18),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      bottomNavigationBar: BottomAppBar(
        height: 60,
        shape: CircularNotchedRectangle(),
        child: Padding(
          padding: const EdgeInsets.only(top: 4, bottom: 4),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              GestureDetector(
                onTap: () {
                  setState(() {
                    index = 0;
                  });
                },
                child: Padding(
                  padding: const EdgeInsets.only(right: 25.0),
                  child: Icon(
                    Icons.menu,
                    size: 30,
                    color: index == 0 ?  Color(0xfff25a18)  : Colors.blueGrey,
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    index = 1;
                  });
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0), 
                  child: Icon(
                    Icons.pie_chart_rounded,
                    size: 30,
                    color: index == 1 ? Color(0xfff25a18) : Colors.blueGrey,
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    index = 2;
                  });
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 23.0), 
                  child: Icon(
                    Icons.home,
                    size: 30,
                    color: index == 2 ?  Color(0xfff25a18) : Colors.blueGrey,
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    index = 3;
                  });
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 28.0), 
                  child: Icon(
                    Icons.add_card,
                    size: 30,
                    color: index == 3 ? Color(0xfff25a18) : Colors.blueGrey,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
