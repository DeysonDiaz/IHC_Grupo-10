import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class SongsGraphics2 extends StatefulWidget {
  SongsGraphics2() : super();
  final String title = "Uso de la App";

  @override
  _SongsGraphics2State createState() => _SongsGraphics2State();
}

class _SongsGraphics2State extends State<SongsGraphics2> {
  List<charts.Series> seriesList;

  static List<charts.Series<App, String>> _createSampleData() {
    final songData1 = [
      new App('Septiembre', 75),
      new App('Octubre', 5),
      new App('Noviembre', 25),
      new App('Diciembre', 100),
    ];
    return [
      new charts.Series<App, String>(
        id: 'App',
        colorFn: (_, __) => charts.MaterialPalette.red.shadeDefault,
        domainFn: (App app, _) => app.app,
        measureFn: (App app, _) => app.month,
        data: songData1,
      ),
    ];
  }

  barChart() {
    return charts.BarChart(
      seriesList,
      animate: true,
      vertical: true,
    );
  }

  @override
  void initState() {
    super.initState();
    seriesList = _createSampleData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
        backgroundColor: Colors.green,
      ),
      body: Container(
        padding: EdgeInsets.only(left: 10),
        child: barChart(),
      ),
    );
  }
}

class App {
  final String app;
  final int month;

  App(this.app, this.month);
}
