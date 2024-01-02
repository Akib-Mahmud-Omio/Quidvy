import 'package:flutter/material.dart';


class Help extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Help"),
          backgroundColor: Colors.orange,
        ),
        body: Padding(
          padding: EdgeInsets.all(16.0),
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black),
              borderRadius: BorderRadius.circular(10.0),
            ),
            padding: EdgeInsets.all(16.0),
            child: Text(
              "1.How to login 'Quidvy'?\nEnter your email and password if you have account before.if dont have account you can sign up using email,phone number and password.\n\n 2.Forgot your password?\n Nothing to worry!! if you provide us your email and phone number ,we will provide you your password.\n\n3.How to use money calculator?\n As we have added a feaure such money calculator,provide us the input we require to calculate your expexted calculation.We are ensuring you that you will get the proper calculation you need."
              ,


              style: TextStyle(fontSize: 18.0),
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