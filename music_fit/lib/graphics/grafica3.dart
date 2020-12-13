import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class SongsGraphics extends StatefulWidget {
  SongsGraphics() : super();
  final String title = "Canción mas escuchada";

  @override
  _SongsGraphicsState createState() => _SongsGraphicsState();
}

class _SongsGraphicsState extends State<SongsGraphics> {
  List<charts.Series> seriesList;

  static List<charts.Series<Song, String>> _createSampleData() {
    final songData1 = [
      new Song('Enero', 5),
      new Song('Febrero', 25),
      new Song('Marzo', 100),
      new Song('Abril', 75),
    ];

    final songData2 = [
      new Song('Enero', 25),
      new Song('Febrero', 50),
      new Song('Marzo', 10),
      new Song('Abril', 20),
    ];

    final songData3 = [
      new Song('Enero', 10),
      new Song('Febrero', 15),
      new Song('Marzo', 50),
      new Song('Abril', 45),
    ];

    final songData4 = [
      new Song('Enero', 20),
      new Song('Febrero', 35),
      new Song('Marzo', 15),
      new Song('Abril', 10),
    ];
    return [
      new charts.Series<Song, String>(
        id: 'Dynamite',
        colorFn: (_, __) => charts.MaterialPalette.purple.shadeDefault,
        domainFn: (Song song, _) => song.song,
        measureFn: (Song song, _) => song.month,
        data: songData1,
      ),
      new charts.Series<Song, String>(
        id: 'Amor...',
        colorFn: (_, __) => charts.MaterialPalette.red.shadeDefault,
        domainFn: (Song song, _) => song.song,
        measureFn: (Song song, _) => song.month,
        data: songData2,
      ),
      new charts.Series<Song, String>(
        id: 'Corre',
        colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
        domainFn: (Song song, _) => song.song,
        measureFn: (Song song, _) => song.month,
        data: songData3,
      ),
      new charts.Series<Song, String>(
        id: 'Aposte...',
        colorFn: (_, __) => charts.MaterialPalette.green.shadeDefault,
        domainFn: (Song song, _) => song.song,
        measureFn: (Song song, _) => song.month,
        data: songData4,
      ),
    ];
  }

  barChart() {
    return charts.BarChart(
      seriesList,
      barGroupingType: charts.BarGroupingType.grouped,
      animate: true,
      vertical: true,
      behaviors: [new charts.SeriesLegend()],
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

class Song {
  final String song;
  final int month;

  Song(this.song, this.month);
}
