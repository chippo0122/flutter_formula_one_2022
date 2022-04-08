import 'package:flutter/material.dart';
//pages
import 'package:flutter_formula_one_2022/pages/home.dart';
import 'package:flutter_formula_one_2022/pages/calender.dart';
import 'package:flutter_formula_one_2022/pages/standing.dart';
import 'package:flutter_formula_one_2022/pages/current.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Formula 1 2022',
      initialRoute: '/home',
      routes: {
        '/home': (context) => const Home(),
        '/calender': (context) => const Calender(),
        '/standing': (context) => const Standing(),
        '/current': (context) => const Current()
      },
    );
  }
}
