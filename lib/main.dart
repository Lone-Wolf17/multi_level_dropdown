import 'package:flutter/material.dart';
import 'package:multi_level_dropdown/views/home.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Multi-Level Dropdown Demo',
      theme: ThemeData(
        primarySwatch: Colors.pink
      ),
      home: const Home(),
    );
  }
}
