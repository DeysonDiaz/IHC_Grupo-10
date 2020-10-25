import 'package:flutter/material.dart';

class ResultsPage extends StatelessWidget {
  Widget build(BuildContext context) {
    final DateTime now = new DateTime.now();
    final PersonData personData = ModalRoute.of(context).settings.arguments;
    
    //Se me fue el inglés
    final int urgenciaInterior = _urgenciaInterior(personData);
    final int tonicaFundamental = _tonicaFundamental(personData.names + personData.lastNames, urgenciaInterior);
    final int tonicaDelDia = _tonicaDelDia(now, tonicaFundamental);
    final int acontecimientoDelDia = _acontecimientoDelDia(now, tonicaDelDia);
    final int cabalaDelDoceMeses = _cabalaDelDoceMeses(now.year);

    return Scaffold(
      appBar: AppBar(title: Text('Resultados')),
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 20),
            Text(personData.toString()),
            Text('Urgencia interior: $urgenciaInterior'),
            Text('Tónica fundamental: $tonicaFundamental'),
            Text('Tónica del día: $tonicaDelDia'),
            Text('Acontecimiento del día: $acontecimientoDelDia'),
            Text('Cábala del año: Arcano $cabalaDelDoceMeses'),
          ],
        )
      )
    );
  }

  int sumOfDigits(int number) {
    String numberString = number.toString();
    int sum = 0;
    for(int i = 0; i < numberString.length; i++) {
      sum += int.parse(numberString[i]);
    }
    return sum;
  }

  int kabbalisticSum(int number) {
    while(number >= 10) {
      number = sumOfDigits(number);
    }
    return number;
  }

  int _urgenciaInterior(PersonData personData) {
    return kabbalisticSum(kabbalisticSum(personData.birthDay) + 
      kabbalisticSum(personData.birthMonth) + 
      kabbalisticSum(personData.birthYear));
  }

  int _tonicaFundamental(String fullName, int urgenciaInterior) {
    final String fullNameWhitoutSpaces = fullName.replaceAll(' ', '');
    return kabbalisticSum(kabbalisticSum(fullNameWhitoutSpaces.length) + urgenciaInterior);
  }

  int _tonicaDelDia(DateTime date, int tonicaFundamental) {
    //Trabajando con el día actual.
    final int kabbalisticSumNow = kabbalisticSum(kabbalisticSum(date.day) + kabbalisticSum(date.month) + kabbalisticSum(date.year));
    return kabbalisticSum(tonicaFundamental + kabbalisticSumNow);
  }

  int _acontecimientoDelDia(DateTime date, int tonicaDelDia) {
    //Trabajando con la hora actual.
    int hour = date.hour % 12;
    if(hour == 0) hour = 12;
    return kabbalisticSum(hour + tonicaDelDia);
  }

  int _cabalaDelDoceMeses(int year) {
    //Solo se está calculando una vez
    return sumOfDigits(year);
  }
}

class PersonData {
  String names, lastNames;
  int birthDay, birthMonth, birthYear;

  PersonData({this.names, this.lastNames, this.birthDay, this.birthMonth, this.birthYear});

  String toString() {
    return 'Nombre: ' + names + ' ' + lastNames + '\nFecha de nacimiento: '
      + birthDay.toString() + '/' + birthMonth.toString() + '/' + birthYear.toString();
  }
}
