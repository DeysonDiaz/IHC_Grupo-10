import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class ExerciseType extends StatefulWidget {
  _ExerciseTypeState createState() => _ExerciseTypeState();
}

class _ExerciseTypeState extends State<ExerciseType> {
  List<charts.Series<Exercise, String>> seriesData;

  void initState() {
    super.initState();
    seriesData = List<charts.Series<Exercise, String>>();
    var exerciseList = [
      new Exercise("A pie", 63.3, Colors.red),
      new Exercise("Bicicleta", 36.7, Colors.blue),
    ];
    seriesData.add(
      charts.Series(
        id: "Ejercicio",
        data: exerciseList,
        domainFn: (Exercise exercise, _) => exercise.type,
        measureFn: (Exercise exercise, _) => exercise.use,
        colorFn: (Exercise exercise, _) => charts.ColorUtil.fromDartColor(exercise.color),
        labelAccessorFn: (Exercise exercise, _) => "${exercise.use}%",
      )
    );
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tipo de ejercicio"),
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
                "Porcentaje de tiempo empleado en cada ejercicio",
                style: TextStyle(
                  fontSize: 18,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 10),
              Expanded(
                child: charts.PieChart(
                  seriesData,
                  animate: true,
                  animationDuration: Duration(seconds: 1),
                  behaviors: [
                    new charts.DatumLegend(
                      outsideJustification: charts.OutsideJustification.endDrawArea,
                      horizontalFirst: false,
                      cellPadding: new EdgeInsets.only(bottom: 4),
                      entryTextStyle: charts.TextStyleSpec(
                        color: charts.MaterialPalette.black, 
                      ) 
                    )
                  ],
                  defaultRenderer: new charts.ArcRendererConfig(
                    arcRendererDecorators: [
                      new charts.ArcLabelDecorator(
                        labelPosition: charts.ArcLabelPosition.inside
                      )
                    ]
                  ),
                ),
              )
            ],
          )
        ),
      )
    );
  }
}

class Exercise {
  String type;
  double use;
  Color color;
  Exercise(this.type, this.use, this.color);
}