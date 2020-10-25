import 'package:flutter/material.dart';
import 'package:cabala/screens/my_home_page.dart';
import 'package:cabala/screens/results.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cábala',
      theme: ThemeData.dark(),
      initialRoute: '/',
      routes: {
        '/': (BuildContext context) => MyHomePage(),
        '/results': (BuildContext context) => ResultsPage()
      }
    );
  }
}
