import 'package:music_fit/main.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(
      Duration(seconds: 4),
      () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => MyHomePage(),
        ),
      ),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/4.jpg"),
            colorFilter: new ColorFilter.mode(
                Colors.black.withOpacity(0.8), BlendMode.dstATop),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Spacer(),
            Padding(
              padding: const EdgeInsets.only(bottom: 30),
              child: Text('MUSIC FIT',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 50,
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
