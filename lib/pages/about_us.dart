import 'package:flutter/material.dart';


class AboutUs extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.orange,
          title: Text("About Us"),
        ),
        body: Container(
          margin: EdgeInsets.all(16.0),
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.orange,
              width: 2.0,
            ),
            borderRadius: BorderRadius.circular(12.0),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "'Quidvy' is one of the best app for keeping calculation of your expenses and income in your day to day life.This app has been inclided various features such as graph,interest calculator,compound interest calculator,Vat calculator,etc.The main intention of this features is making user feel a good calculating and tracing money expensing and incoming environment.   you can create account there;this will obviously user friendly,then you can enjoy any of the featues of this app according to your wish.The best thing of the app will be the -'transaction History' .The history will be updated with time if you add expenses and income here with the amount and the Sources...This app will save you from the wastage of time,wastage of maoney and obviously give you a direction where you should expense your money.The graphically representation of the expenses will give you a knowledge how much you are expensing money from the previous time.you have to decide here are those expenses are really logical.....?",

              style: TextStyle(fontSize: 16.0),
            ),
          ),
        ),

        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Icon(Icons.arrow_back),
          backgroundColor: Colors.orange,
        ),
      ),
    );
  }
}