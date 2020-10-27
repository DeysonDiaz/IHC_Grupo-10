import 'package:flutter/material.dart';
import 'package:cabala/screens/my_home_page.dart';
import 'package:cabala/screens/results.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
        localizationsDelegates: [GlobalMaterialLocalizations.delegate],
        supportedLocales: [
          const Locale('es'),
        ],
        title: 'Cábala',
        theme: ThemeData.dark(),
        initialRoute: '/',
        routes: {
          '/': (BuildContext context) => PageInitial(),
          '/home': (BuildContext context) => MyHomePage(),
          '/results': (BuildContext context) => ResultsPage()
        });
  }
}

class PageInitial extends StatefulWidget {
  _PageInitial createState() => new _PageInitial();
}

class _PageInitial extends State<PageInitial> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(bottom: 40),
              child: Text('CABACALC',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 60)),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: Image.asset(
                'assets/images/img1.jpg',
                height: 180,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: RaisedButton(
                  child: Text('Acceder',
                      style: TextStyle(color: Colors.white, fontSize: 20)),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(15),
                          topRight: Radius.circular(15),
                          bottomLeft: Radius.circular(15),
                          bottomRight: Radius.circular(15))),
                  onPressed: () {
                    showResultsPage(context);
                  }),
            ),
          ],
        ),
      ),
    );
  }
}

void showResultsPage(BuildContext context) {
  Navigator.of(context).pushNamed('/home');
}
