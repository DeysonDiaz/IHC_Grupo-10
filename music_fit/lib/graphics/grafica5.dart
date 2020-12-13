import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class SongsGraphics3 extends StatefulWidget {
  SongsGraphics3() : super();
  final String title = "Calorias quemadas";

  @override
  _SongsGraphics3State createState() => _SongsGraphics3State();
}

class _SongsGraphics3State extends State<SongsGraphics3> {
  List<charts.Series> seriesList;

  static List<charts.Series<TimeSeriesSales, DateTime>> _createSampleData() {
    final data = [
      new TimeSeriesSales(new DateTime(2017, 9, 19), 5),
      new TimeSeriesSales(new DateTime(2017, 9, 26), 25),
      new TimeSeriesSales(new DateTime(2017, 10, 3), 80),
      new TimeSeriesSales(new DateTime(2017, 10, 10), 75),
    ];
    return [
      new charts.Series<TimeSeriesSales, DateTime>(
        id: 'Calorias',
        colorFn: (_, __) => charts.MaterialPalette.purple.shadeDefault,
        domainFn: (TimeSeriesSales sales, _) => sales.time,
        measureFn: (TimeSeriesSales sales, _) => sales.sales,
        data: data,
      )
    ];
  }

  barChart() {
    return charts.TimeSeriesChart(
      seriesList,
      animate: true,
      dateTimeFactory: const charts.LocalDateTimeFactory(),
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

class TimeSeriesSales {
  final DateTime time;
  final int sales;

  TimeSeriesSales(this.time, this.sales);
}