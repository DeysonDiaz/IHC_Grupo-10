import 'package:flutter/material.dart';
import 'package:cabala/screens/my_home_page.dart';
import 'package:cabala/screens/results.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate
      ],
      supportedLocales: [
        const Locale('es'),
      ],
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
