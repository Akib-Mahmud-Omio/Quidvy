import 'package:flutter/material.dart';
import 'package:quidvy/pages/bottomnavigationbar.dart';
void main() {
  runApp(const MyApp());
}

@override
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home:Bottom(),
    );
  }

}