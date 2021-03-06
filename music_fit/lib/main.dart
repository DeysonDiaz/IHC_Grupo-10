import 'package:flutter/material.dart';
import 'package:music_fit/language.dart';
import 'signup.dart';
import 'UI/listview_song.dart';
import 'recovery.dart';
import 'package:music_fit/UI/splash_screen.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:music_fit/generated/l10n.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:music_fit/blocs/preferences_bloc.dart';
import 'package:music_fit/repositories/preferences_repository_impl.dart';
import 'package:flutter_localized_locales/flutter_localized_locales.dart';
import 'package:music_fit/graphics/grafica1.dart';
import 'package:music_fit/graphics/grafica2.dart';
import 'package:music_fit/graphics/grafica3.dart';
import 'package:music_fit/graphics/grafica4.dart';
import 'package:music_fit/graphics/grafica5.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final preferencesRepository = PreferencesRepositoryImpl();

  final preferencesBloc = PreferencesBloc(
    preferencesRepository: preferencesRepository,
    initialLocale: await preferencesRepository.locale,
  );

  runApp(
    BlocProvider(
      create: (context) => preferencesBloc,
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PreferencesBloc, PreferencesState>(
      builder: (context, state) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          initialRoute: '/',
          routes: <String, WidgetBuilder>{
            '/': (BuildContext context) => new SplashScreen(),
            '/language': (BuildContext context) => new Language(),
            '/signup': (BuildContext context) => new SignupPage(),
            '/listview': (BuildContext context) => new ListViewSong(),
            '/recovery': (BuildContext context) => new RecoveryPage(),
            '/grafica1': (BuildContext context) => new GeneralStats(),
            '/grafica2': (BuildContext context) => new ExerciseType(),
            '/grafica3': (BuildContext context) => new SongsGraphics(),
            '/grafica4': (BuildContext context) => new SongsGraphics2(),
            '/grafica5': (BuildContext context) => new SongsGraphics3(),
          },
          localizationsDelegates: [
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
            AppLocalizations.delegate,
            LocaleNamesLocalizationsDelegate(),
          ],
          supportedLocales: AppLocalizations.delegate.supportedLocales,
          locale: state.locale,
        );
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      resizeToAvoidBottomPadding: false,
      body: Form(
          child: Container(
              /*decoration: new BoxDecoration(
                image: new DecorationImage(
                    image: new AssetImage("assets/images/3.jpg"),
                    fit: BoxFit.cover),
              ),*/
              child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            child: Stack(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.only(top: 50, left: 10),
                  child: Text('   Music',
                      style: TextStyle(
                          fontSize: 80.0, fontWeight: FontWeight.bold)),
                ),
                Container(
                  padding: EdgeInsets.only(top: 120, left: 10),
                  child: Text('   Fit',
                      style: TextStyle(
                          fontSize: 80.0, fontWeight: FontWeight.bold)),
                ),
                Container(
                  padding: EdgeInsets.only(top: 120, left: 140),
                  child: Text('  .',
                      style: TextStyle(
                          fontSize: 80.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.green)),
                )
              ],
            ),
          ),
          Container(
              padding: EdgeInsets.only(top: 35.0, left: 20.0, right: 20.0),
              child: Column(
                children: <Widget>[
                  TextField(
                    decoration: InputDecoration(
                        labelText: AppLocalizations.of(context).email,
                        labelStyle: TextStyle(
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.bold,
                            color: Colors.grey),
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.green))),
                  ),
                  SizedBox(height: 20.0),
                  TextField(
                    decoration: InputDecoration(
                        labelText: AppLocalizations.of(context).password,
                        labelStyle: TextStyle(
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.bold,
                            color: Colors.grey),
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.green))),
                    obscureText: true,
                  ),
                  SizedBox(height: 5.0),
                  Container(
                    alignment: Alignment(1.0, 0.0),
                    padding: EdgeInsets.only(top: 15.0, left: 20.0),
                    child: InkWell(
                      onTap: () {
                        Navigator.of(context).pushNamed('/recovery');
                      },
                      child: Center(
                        child: Text(
                          AppLocalizations.of(context).btnquestion,
                          style: TextStyle(
                              color: Colors.green,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Montserrat',
                              decoration: TextDecoration.underline),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 40.0),
                  Container(
                    height: 40.0,
                    child: Material(
                      borderRadius: BorderRadius.circular(20.0),
                      shadowColor: Colors.greenAccent,
                      color: Colors.green,
                      elevation: 7.0,
                      child: GestureDetector(
                        onTap: () {
                          Navigator.of(context).pushNamed('/listview');
                        },
                        child: Center(
                          child: Text(
                            AppLocalizations.of(context).btnlogin,
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Montserrat'),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 20.0),
                ],
              )),
          SizedBox(height: 15.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                AppLocalizations.of(context).question2,
                style: TextStyle(fontFamily: 'Montserrat'),
              ),
              SizedBox(width: 5.0),
              InkWell(
                onTap: () {
                  Navigator.of(context).pushNamed('/signup');
                },
                child: Text(
                  AppLocalizations.of(context).btnregistration,
                  style: TextStyle(
                      color: Colors.green,
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.bold,
                      decoration: TextDecoration.underline),
                ),
              )
            ],
          ),
        ],
      ))),
    );
  }
}
