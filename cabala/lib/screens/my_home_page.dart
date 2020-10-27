import 'package:flutter/material.dart';
import 'package:cabala/screens/results.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:intl/intl.dart';

class MyHomePage extends StatefulWidget {
  _MyHomePage createState() => _MyHomePage();
}

class _MyHomePage extends State<MyHomePage> {
  String fullNameValue;
  DateTime birthdateValue;

  final formKey = GlobalKey<FormState>();

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('             Cabacalc')),
        body: Padding(
          padding: const EdgeInsets.only(top: 30),
          child: Container(
              alignment: Alignment.center,
              margin: EdgeInsets.all(15),
              child: Center(
                  child: Form(
                      key: formKey,
                      child: ListView(children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(bottom: 20),
                          child: Text(
                            'Ingrese sus datos',
                            style: TextStyle(fontSize: 30),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        TextFormField(
                          decoration:
                              InputDecoration(labelText: 'Nombre completo:'),
                          onSaved: (value) {
                            fullNameValue = value;
                          },
                          validator: (value) {
                            if (value.trim().isEmpty)
                              return 'Rellene este campo';
                            return null;
                          },
                        ),
                        DateTimeField(
                          decoration: InputDecoration(
                              labelText: 'Fecha de nacimiento:'),
                          onSaved: (value) {
                            birthdateValue = value;
                          },
                          validator: (value) {
                            if (value == null) return 'Rellene este campo';
                            return null;
                          },
                          format: DateFormat("dd-MM-yyyy"),
                          onShowPicker:
                              (BuildContext context, DateTime currentValue) {
                            return showDatePicker(
                              context: context,
                              firstDate: DateTime(1900),
                              initialDate: DateTime.now(),
                              lastDate: DateTime.now(),
                            );
                          },
                        ),
                        SizedBox(height: 15),
                        Container(
                          alignment: Alignment.center,
                          child: OutlineButton(
                              child: Text('Calcular estudio',
                                  style: TextStyle(fontSize: 20)),
                              onPressed: () {
                                showResultsPage(context);
                              }),
                        )
                      ])))),
        ));
  }

  void showResultsPage(BuildContext context) {
    if (formKey.currentState.validate()) {
      formKey.currentState.save();
      Navigator.of(context).pushNamed('/results',
          arguments: Person(
            fullName: fullNameValue,
            birthdate: birthdateValue,
          ));
    }
  }
}
