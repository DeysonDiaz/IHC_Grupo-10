import 'package:Cabacalc/screens/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:Cabacalc/screens/form.dart';
import 'package:Cabacalc/screens/results.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
        localizationsDelegates: [GlobalMaterialLocalizations.delegate],
        supportedLocales: [
          const Locale('es'),
        ],
        title: 'Cabacalc',
        theme: ThemeData.dark(),
        initialRoute: '/',
        routes: {
          '/': (BuildContext context) => SplashScreen(),
          '/home': (BuildContext context) => InitialPage(),
          '/form': (BuildContext context) => FormPage(),
          '/results': (BuildContext context) => ResultsPage()
        });
  }
}

class InitialPage extends StatelessWidget {
  Widget build(BuildContext context) {
    return new Scaffold(
      body: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/img1.jpg"),
            colorFilter: new ColorFilter.mode(
                Colors.black.withOpacity(0.3), BlendMode.dstATop),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('CABACALC',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 50)),
            SizedBox(height: 40),
            RaisedButton(
              child: Text('Comenzar',
                  style: TextStyle(color: Colors.white, fontSize: 20)),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(15))),
              onPressed: () => goToFormPage(context),
            ),
          ],
        ),
      ),
    );
  }

  void goToFormPage(BuildContext context) {
    Navigator.of(context).pushNamed('/form');
  }
}
