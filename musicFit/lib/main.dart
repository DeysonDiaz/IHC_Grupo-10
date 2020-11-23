import 'package:flutter/material.dart';
import 'signup.dart';

void main() =>
  runApp(new MyApp());


class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
      return new MaterialApp(
      debugShowCheckedModeBanner: false,      
      routes: <String, WidgetBuilder>{
        '\signup':(BuildContext context) => new SignupPage(),
      },
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    var height2 = 15.0;
    return new Scaffold(
      resizeToAvoidBottomPadding: false,
      body: Column(
        children: <Widget>[
          Container(
            child: Stack(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.fromLTRB(15.0, 110.0, 0.0, 0.0),
                  child: Text(
                    'Choco',
                    style: TextStyle(
                      fontSize: 80.0,fontWeight: FontWeight.bold),
                  ),                  
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(15.0, 175.0, 0.0, 0.0),
                  child: Text(
                    'Music',
                    style: TextStyle(
                      fontSize: 80.0,fontWeight: FontWeight.bold),
                  ),                 
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(200.0, 175.0, 0.0, 0.0),
                  child: Text(
                    '.',
                    style: TextStyle(
                      fontSize: 80.0,fontWeight: FontWeight.bold, color: Colors.green),
                  ),                  
                ),
                
                Container(
                  padding: EdgeInsets.only(top:35.0,left:20.0, right:20.0),

                  child: Column(
                    children: <Widget>[
                      TextField(
                        decoration: InputDecoration(
                          labelText: 'EMAIL',
                          labelStyle: TextStyle(
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.bold,
                            color:Colors.grey
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color:Colors.green)
                          )
                        ),
                      ),
                      SizedBox(height: 20.0),
                      TextField(                        
                        decoration: InputDecoration(
                          labelText: 'PASSWORD',
                          labelStyle: TextStyle(
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.bold,
                            color:Colors.grey
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color:Colors.green)
                          ),
                        ),
                        obscureText: true,
                      ),
                      SizedBox(height: 5.0),
                      Container(
                        alignment: Alignment(1.0,0.0),
                        padding: EdgeInsets.only(top:15.0, left: 20.0),
                        child:  InkWell(
                          child: Text(
                            'Olvido Contraseña',
                            style: TextStyle(
                              color: Colors.green,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Montserrat',
                              decoration:TextDecoration.underline
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 40.0),
                      Container(
                        height: 40.0,
                        child:Material(
                          borderRadius: BorderRadius.circular(20.0),
                          shadowColor: Colors.greenAccent,
                          color: Colors.green,
                          elevation: 7.0,
                          child: GestureDetector(
                            onTap: (){},
                            child: Center(
                              child: Text(
                                'LOGIN',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Montserrat',
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 15.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            '¿No tienes una cuenta?',
                            style: TextStyle(
                              fontFamily: 'Montserrat'
                            ),
                          ),
                          SizedBox(width:5.0),
                          InkWell(
                            onTap: (){
                              Navigator.of(context).pushNamed('/signup')
                            },
                            child: Text(
                              'registrate',
                              style: TextStyle(
                                color: Colors.green,
                                fontFamily: 'Montserrat',
                                fontWeight: FontWeight.bold,
                                decoration: TextDecoration.underline,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),                  
                ),
              ],
            )
          )
          
        ],
      ),
    );
  }
}
