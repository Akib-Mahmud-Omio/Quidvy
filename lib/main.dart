import 'package:flutter/material.dart';
import 'package:quidvy/pages/login.dart';
void main() {
  runApp(const MyApp());
}

@override
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home:LoginPage(),
    );
  }

}