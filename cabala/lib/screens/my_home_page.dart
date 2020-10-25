import 'package:flutter/material.dart';
import 'package:cabala/screens/results.dart';

class MyHomePage extends StatefulWidget {
  _MyHomePage createState() => _MyHomePage();
}

class _MyHomePage extends State<MyHomePage> {
  String namesValue, lastNamesValue;
  int birthDayValue, birthMonthValue, birthYearValue;

  FocusNode namesFocus,
      lastNamesFocus,
      birthDayFocus,
      birthMonthFocus,
      birthYearFocus;

  final formKey = GlobalKey<FormState>();

  void initState() {
    super.initState();
    namesFocus = FocusNode();
    lastNamesFocus = FocusNode();
    birthDayFocus = FocusNode();
    birthMonthFocus = FocusNode();
    birthYearFocus = FocusNode();
  }

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Cálculo numerológico')),
        body: Container(
            alignment: Alignment.center,
            margin: EdgeInsets.all(15),
            child: Center(
                child: Form(
                    key: formKey,
                    child: ListView(children: <Widget>[
                      Image.asset(
                        'assets/images/numerologia.jpg',
                        height: 225,
                        width: 333,
                      ),
                      Text(
                        'Ingrese sus datos:',
                        style: TextStyle(fontSize: 16),
                        textAlign: TextAlign.center,
                      ),
                      TextFormField(
                        focusNode: namesFocus,
                        decoration: InputDecoration(labelText: 'Nombre(s):'),
                        onSaved: (value) {
                          namesValue = value;
                        },
                        validator: (value) {
                          if (value.trim().isEmpty) return 'Rellene este campo';
                          return null;
                        },
                        onEditingComplete: () {
                          FocusScope.of(context).requestFocus(lastNamesFocus);
                        },
                      ),
                      TextFormField(
                        focusNode: lastNamesFocus,
                        decoration: InputDecoration(labelText: 'Apellido(s):'),
                        onSaved: (value) {
                          lastNamesValue = value;
                        },
                        validator: (value) {
                          if (value.trim().isEmpty) return 'Rellene este campo';
                          return null;
                        },
                        onEditingComplete: () {
                          FocusScope.of(context).requestFocus(birthDayFocus);
                        },
                      ),
                      TextFormField(
                        focusNode: birthDayFocus,
                        decoration:
                            InputDecoration(labelText: 'Día de nacimiento:'),
                        keyboardType: TextInputType.number,
                        onSaved: (value) {
                          birthDayValue = int.parse(value);
                        },
                        validator: (value) {
                          if (value.trim().isEmpty) return 'Rellene este campo';
                          int day = int.parse(value, onError: (e) => null);
                          if (day == null || day < 1 || 31 < day)
                            return 'Dato inválido';
                          return null;
                        },
                        onEditingComplete: () {
                          FocusScope.of(context).requestFocus(birthMonthFocus);
                        },
                      ),
                      TextFormField(
                        focusNode: birthMonthFocus,
                        decoration:
                            InputDecoration(labelText: 'Mes de nacimiento:'),
                        keyboardType: TextInputType.number,
                        onSaved: (value) {
                          birthMonthValue = int.parse(value);
                        },
                        validator: (value) {
                          if (value.trim().isEmpty) return 'Rellene este campo';
                          int month = int.parse(value, onError: (e) => null);
                          if (month == null || month < 1 || 12 < month)
                            return 'Dato inválido';
                          return null;
                        },
                        onEditingComplete: () {
                          FocusScope.of(context).requestFocus(birthYearFocus);
                        },
                      ),
                      TextFormField(
                        focusNode: birthYearFocus,
                        decoration:
                            InputDecoration(labelText: 'Año de nacimiento:'),
                        keyboardType: TextInputType.number,
                        onSaved: (value) {
                          birthYearValue = int.parse(value);
                        },
                        validator: (value) {
                          if (value.trim().isEmpty) return 'Rellene este campo';
                          int year = int.parse(value, onError: (e) => null);
                          if (year == null || year < 1 || 2020 < year)
                            return 'Dato inválido';
                          return null;
                        },
                      ),
                      SizedBox(height: 10),
                      OutlineButton(
                          child: Text('Calcular estudio'),
                          onPressed: () {
                            showResultsPage(context);
                          })
                    ])))));
  }

  void showResultsPage(BuildContext context) {
    if (formKey.currentState.validate()) {
      formKey.currentState.save();
      Navigator.of(context).pushNamed('/results',
          arguments: PersonData(
              names: namesValue,
              lastNames: lastNamesValue,
              birthDay: birthDayValue,
              birthMonth: birthMonthValue,
              birthYear: birthYearValue));
    }
  }

  void dispose() {
    super.dispose();
    namesFocus.dispose();
    lastNamesFocus.dispose();
    birthDayFocus.dispose();
    birthMonthFocus.dispose();
    birthYearFocus.dispose();
  }
}
