import 'package:bro_prj/home_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'flutter prj',
      theme: ThemeData(
       
        primarySwatch: Colors.orange,
      ),
      home: const HomeScreen(),
    );
  }
}
