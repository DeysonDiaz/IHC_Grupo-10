import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ResultsPage extends StatelessWidget {
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
    final Person person = ModalRoute.of(context).settings.arguments;

    final int innerUrgencyValue = person.innerUrgency();
    final int fundamentalTonicValue = person.fundamentalTonic();
    final int tonicOfTodayValue = person.tonicOfTheDay(now);
    final int nowEventValue = person.eventOfTheDay(now);
    final Map<int, int> yearCabalaValue = person.yearCabala(5);

    return Scaffold(
        appBar: AppBar(title: Text('Resultados'), centerTitle: true),
        body: ListView(
          padding: EdgeInsets.only(top: 20, bottom: 15),
          children: <Widget>[
            Text(person.toString(),
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center),
            SizedBox(height: 10),
            Divider(thickness: 5, height: 10),
            ListTile(
                title: Text('Urgencia interior: $innerUrgencyValue',
                    style: TextStyle(fontSize: 18)),
                leading: Icon(Icons.person),
                onTap: () => showInnerUrgencyInfo(context, innerUrgencyValue)),
            Image.asset('assets/images/img2.jpeg', height: 150),
            SizedBox(height: 10),
            Divider(thickness: 5, height: 10),
            ListTile(
                title: Text('Tónica fundamental: $fundamentalTonicValue',
                    style: TextStyle(fontSize: 18)),
                leading: Icon(Icons.handyman),
                onTap: () =>
                    showFundamentalTonicInfo(context, fundamentalTonicValue)),
            Image.asset('assets/images/img3.jpeg', height: 120),
            SizedBox(height: 10),
            Divider(thickness: 5, height: 10),
            ListTile(
                title: Text('Tónica de hoy: $tonicOfTodayValue',
                    style: TextStyle(fontSize: 18)),
                leading: Icon(Icons.wb_sunny),
                onTap: () => showTonicOfTodayInfo(context, tonicOfTodayValue)),
            Image.asset('assets/images/img4.jpeg', height: 135),
            SizedBox(height: 10),
            Divider(thickness: 5, height: 10),
            ListTile(
                title: Text('Acontecimiento de este momento: $nowEventValue',
                    style: TextStyle(fontSize: 18)),
                leading: Icon(Icons.timer),
                onTap: () => showNowEventInfo(context, nowEventValue)),
            Image.asset('assets/images/img5.jpeg', height: 120),
            SizedBox(height: 10),
            Divider(thickness: 5, height: 10),
            ListTile(
                title: Text('Ver cábala del año y números regentes',
                    style: TextStyle(fontSize: 18)),
                leading: Icon(Icons.calendar_today),
                onTap: () => showYearCabalaInfo(context, yearCabalaValue)),
            Image.asset('assets/images/img6.jpeg', height: 225),
            SizedBox(height: 10),
            Divider(thickness: 5, height: 10),
            ListTile(
              title: Text('Ver información sobre los números',
                  style: TextStyle(fontSize: 18)),
              leading: Icon(Icons.info),
              onTap: () => showNumbersInfo(context),
            ),
            Image.asset('assets/images/img7.jpg', height: 110)
          ],
        ));
  }

  void showInnerUrgencyInfo(BuildContext context, int innerUrgency) {
    final List<String> innerUrgencyData = [
      'emprendedora, original, con voluntad.',
      'sociable, con imaginación.',
      'creativa, con arte y belleza.',
      'firme, sólida.',
      'razonativa, con rigor, propensa al aprendizaje.',
      'cariñosa, indecisa.',
      'tendiente a luchar.',
      'paciente.',
      'generosa, con ideas geniales, independiente.',
    ];
    final String dialogContent =
        'La urgencia interior es como tendemos a ser, como un signo zodiacal, pero numérico. Tu urgencia interior es $innerUrgency.\n' +
            'Este número hace a la persona ${innerUrgencyData[innerUrgency - 1]}';
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Urgencia interior'),
            content: Text(dialogContent),
            actions: [
              FlatButton(
                child: Text("OK", style: TextStyle(color: Colors.blue)),
                onPressed: () => Navigator.of(context).pop(),
              )
            ],
          );
        });
  }

  void showFundamentalTonicInfo(BuildContext context, int fundamentalTonic) {
    final List<String> fundamentalTonicData = [
      'trabajar con mucha voluntad, con ideas originales, ser emprendedor.',
      'aprender a asociarse con los demás, escuchar opiniones contrarias sin enojarse, desarrollar la imaginación creadora.',
      'trabajar con arte y belleza en todo lo que haga, en el vestir, en el hablar.',
      'poner las bases firmes en sus proyectos y trabajos.',
      'ver el pro y el contra de todo lo que se proponga.',
      'ser decisivo y poner cariño a lo que haga.',
      'poner mucho empeño en todo lo que haga.',
      'ser muy paciente, saber esperar.',
      'ser generosa y genial, de preferencia trabajar independientemente.',
    ];
    final String dialogContent =
        'La tónica fundamental es en lo que tenemos que trabajar para triunfar en la vida. Tu tónica fundamental es $fundamentalTonic.\n' +
            'Este número indica que la persona tiene que ${fundamentalTonicData[fundamentalTonic - 1]}';
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Tónica fundamental'),
            content: Text(dialogContent),
            actions: [
              FlatButton(
                child: Text("OK", style: TextStyle(color: Colors.blue)),
                onPressed: () => Navigator.of(context).pop(),
              )
            ],
          );
        });
  }

  void showTonicOfTodayInfo(BuildContext context, int tonicOfToday) {
    final List<String> tonicOfTodayData = [
      'trabajar con mucha voluntad, con ideas originales, ser emprendedor.',
      'aprender a asociarse con los demás, escuchar opiniones contrarias sin enojarse, desarrollar la imaginación creadora.',
      'trabajar con arte y belleza en todo lo que haga, en el vestir, en el hablar.',
      'poner las bases firmes en sus proyectos y trabajos.',
      'ser decisivo y poner cariño a lo que haga.',
      'ver el pro y el contra de todo lo que se proponga.',
      'poner mucho empeño en todo lo que haga.',
      'ser muy paciente, saber esperar.',
      'ser generosa y genial, de preferencia trabajar independientemente.',
    ];
    final String dialogContent = 'Tu número para hoy es $tonicOfToday, ' +
        'lo que indica que para tener más probabilidades de éxito en lo que te propongas este día, deberías: ${tonicOfTodayData[tonicOfToday - 1]}';
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Regencia, tónica de hoy'),
            content: Text(dialogContent),
            actions: [
              FlatButton(
                child: Text("OK", style: TextStyle(color: Colors.blue)),
                onPressed: () => Navigator.of(context).pop(),
              )
            ],
          );
        });
  }

  void showNowEventInfo(BuildContext context, int nowEvent) {
    String dialogContent =
        'A esta hora de este mismo día, lo mejor es regirse bajo el número $nowEvent para realizar con éxito lo que deseas ahora.';
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Acontecimiento de este momento'),
            content: Text(dialogContent),
            actions: [
              FlatButton(
                child: Text("OK", style: TextStyle(color: Colors.blue)),
                onPressed: () => Navigator.of(context).pop(),
              )
            ],
          );
        });
  }

  void showYearCabalaInfo(BuildContext context, Map<int, int> yearsCabala) {
    String dialogContent =
        'Durante la vida tenemos años espaciales relacionados con la ley de causa y efecto (Karma), ' +
            'dependerá de uno si el número nos favorezca o esté en contra de uno, por sus actos.';
    yearsCabala.forEach((key, value) {
      dialogContent += '\nAño: $key, número regente: $value';
    });
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Cábala del año'),
            content: Text(dialogContent),
            actions: [
              FlatButton(
                child: Text("OK", style: TextStyle(color: Colors.blue)),
                onPressed: () => Navigator.of(context).pop(),
              )
            ],
          );
        });
  }

  void showNumbersInfo(BuildContext context) {
    final List<String> numbersInfoData = [
      'Espada, voluntad, poder.',
      'Ciencia oculta, favorable.',
      'Producción material y espiritual.',
      'Mando, progreso, éxito, misericordia.',
      'El Karma, Marte, guerra.',
      'Victoria, buena suerte.',
      'Guerras, luchas, expiación, dolor, amargura.',
      'Sufrimientos, pruebas, dolor.',
      'Soledad, sufrimientos.',
      'Buenos negocios, cambios.',
      'Favorece la Ley, que no haya temor, Marte.',
      'Pruebas y dolor, arcano A.Z.F. nos saca del dolor.',
      'Transformaciones, indica cambio total.',
      'Larga vida, estabilidad, no cambio.',
      'Fracaso amoroso, anuncia peligros.',
      'Castigo, caída terrible, evítese esta fecha.',
      'Esperanza, espera.',
      'Los enemigos ocultos saltan en cualquier momento, enfermedades, no negocios.',
      'Éxitos, buena suerte, la Piedra Filosofal.',
      'Cambios favorables, acabar con las debilidades.',
      'Desmoralización total para el mal.',
      'Triunfo, todo sale bien, poder, fuerza, buena suerte',
    ];
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return FractionallySizedBox(
            child: AlertDialog(
              title: Text('Información sobre los números'),
              content: ListView.builder(
                  itemCount: numbersInfoData.length,
                  itemBuilder: (BuildContext ctxt, int index) {
                    return Text(
                        'Arcano ${index + 1}: ${numbersInfoData[index]}');
                  }),
              actions: [
                FlatButton(
                  child: Text("OK", style: TextStyle(color: Colors.blue)),
                  onPressed: () => Navigator.of(context).pop(),
                )
              ],
            ),
          );
        });
  }
}

class Person {
  String fullName;
  DateTime birthdate;

  Person({this.fullName, this.birthdate});

  String getBirthdate() {
    final DateFormat formatter = DateFormat('dd/MM/yyyy');
    return formatter.format(birthdate);
  }

  int innerUrgency() {
    return kabbalisticSum(kabbalisticSum(birthdate.day) +
        kabbalisticSum(birthdate.month) +
        kabbalisticSum(birthdate.year));
  }

  int fundamentalTonic() {
    final int fullNameSize = fullName.replaceAll(' ', '').length;
    return kabbalisticSum(kabbalisticSum(fullNameSize) + innerUrgency());
  }

  int tonicOfTheDay(DateTime date) {
    final int kabbalisticSumDate = kabbalisticSum(kabbalisticSum(date.day) +
        kabbalisticSum(date.month) +
        kabbalisticSum(date.year));
    return kabbalisticSum(fundamentalTonic() + kabbalisticSumDate);
  }

  int eventOfTheDay(DateTime date) {
    //Trabajando con la hora actual.
    int hour = date.hour % 12;
    if (hour == 0) hour = 12;
    return kabbalisticSum(hour + tonicOfTheDay(date));
  }

  Map<int, int> yearCabala(int numberOfYears) {
    int currentYear = birthdate.year + sumOfDigits(birthdate.year);
    Map<int, int> arcana = Map<int, int>();

    for (int i = 0; i < numberOfYears; i++) {
      arcana[currentYear] = kabbalisticSum(currentYear);
      currentYear += sumOfDigits(currentYear);
    }

    return arcana;
  }

  int sumOfDigits(int number) {
    String numberString = number.toString();
    int sum = 0;
    for (int i = 0; i < numberString.length; i++) {
      sum += int.parse(numberString[i]);
    }
    return sum;
  }

  int kabbalisticSum(int number) {
    while (number >= 10) {
      number = sumOfDigits(number);
    }
    return number;
  }

  String toString() {
    return 'Nombre: ' + fullName + '\nFecha de nacimiento: ' + getBirthdate();
  }
}
