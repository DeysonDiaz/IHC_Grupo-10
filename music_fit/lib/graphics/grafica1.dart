import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class GeneralStats extends StatefulWidget {
  _GeneralStatsState createState() => _GeneralStatsState();
}

class _GeneralStatsState extends State<GeneralStats> {
  List<charts.Series<Stats, String>> seriesData;

  void initState() {
    super.initState();
    seriesData = List<charts.Series<Stats, String>>();
    final now = DateTime.now();
    var metersList = [
      new Meters(new DateTime(now.year, now.month, now.day - 6), 1100),
      new Meters(new DateTime(now.year, now.month, now.day - 5), 900),
      new Meters(new DateTime(now.year, now.month, now.day - 4), 1200),
      new Meters(new DateTime(now.year, now.month, now.day - 3), 1200),
      new Meters(new DateTime(now.year, now.month, now.day - 2), 1000),
      new Meters(new DateTime(now.year, now.month, now.day - 1), 700),
      new Meters(now, 1100),
    ];
    var caloriesList = [
      new Calories(new DateTime(now.year, now.month, now.day - 6), 275),
      new Calories(new DateTime(now.year, now.month, now.day - 5), 225),
      new Calories(new DateTime(now.year, now.month, now.day - 4), 300),
      new Calories(new DateTime(now.year, now.month, now.day - 3), 300),
      new Calories(new DateTime(now.year, now.month, now.day - 2), 250),
      new Calories(new DateTime(now.year, now.month, now.day - 1), 175),
      new Calories(now, 275),
    ];
    seriesData.add(
      charts.Series(
        id: 'Km',
        data: metersList,
        domainFn: (Stats meters, _) {
          Meters k = meters;
          return "${k.date.day}/${k.date.month}";
        },
        measureFn: (Stats meters, _) {
          Meters k = meters;
          return k.value;
        },
        fillPatternFn: (_, __) => charts.FillPatternType.solid,
        fillColorFn: (_, __) => charts.ColorUtil.fromDartColor(Colors.green),
      ), 
    );
    seriesData.add(
      charts.Series(
        id: 'Cal',
        data: caloriesList,
        domainFn: (Stats calories, _) {
          Calories k = calories;
          return "${k.date.day}/${k.date.month}";
        },
        measureFn: (Stats calories, _) {
          Calories k = calories;
          return k.value;
        },
        fillPatternFn: (_, __) => charts.FillPatternType.solid,
        fillColorFn: (_, __) => charts.ColorUtil.fromDartColor(Colors.red),
      ), 
    );
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Estadísticas generales"),
        centerTitle: true,
        backgroundColor: Colors.green,
      ),
      body: Padding(
        padding: EdgeInsets.only(left: 10, right: 10),
        child: Center(
          child: Column(
            children: <Widget>[
              SizedBox(height: 15),
              Text(
                "Historial sobre el progreso de los últimos 7 días",
                style: TextStyle(
                  fontSize: 18,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 10),
              Text(
                "• Metros recorridos",
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.green
                ),
              ),
              Text(
                "• Calorías quemadas",
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.red,
                ),
              ),
              SizedBox(height: 10),
              Expanded(
                child: charts.BarChart(
                  seriesData,
                  animate: true,
                  barGroupingType: charts.BarGroupingType.grouped,
                  animationDuration: Duration(seconds: 1),
                ),
              ),
            ],
          )
        ),
      )
    );
  }
}

class Stats {
  Stats();
}
class Meters extends Stats {
  DateTime date;
  double value;
  Meters(this.date, this.value);
}
class Calories extends Stats {
  DateTime date;
  int value;
  Calories(this.date, this.value);
}