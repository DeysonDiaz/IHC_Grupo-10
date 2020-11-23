import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:music_fit/Model/song.dart';

class SongInformation extends StatefulWidget {
  final Song song;
  SongInformation(this.song);

  @override
  _SongInformationState createState() => _SongInformationState();
}

final songReference = FirebaseDatabase.instance.reference().child('song');

class _SongInformationState extends State<SongInformation> {
  List<Song> items;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Información de la Canción'),
        backgroundColor: Colors.deepOrangeAccent,
      ),
      body: Container(
        height: 400.0,
        padding: const EdgeInsets.all(20.0),
        child: Card(
          child: Center(
            child: Column(
              children: <Widget>[
                new Text(
                  "Nombre: ${widget.song.nombre}",
                  style: TextStyle(color: Colors.blue, fontSize: 18.0),
                ),
                Divider(),
                new Text(
                  "Artista: ${widget.song.artista}",
                  style: TextStyle(color: Colors.blue, fontSize: 18.0),
                ),
                Divider(),
                new Text(
                  "Álbum: ${widget.song.album}",
                  style: TextStyle(color: Colors.blue, fontSize: 18.0),
                ),
                Divider(),
                new Text(
                  "Año: ${widget.song.anio}",
                  style: TextStyle(color: Colors.blue, fontSize: 18.0),
                ),
                Divider(),
                new Text(
                  "Duración: ${widget.song.duracion}",
                  style: TextStyle(color: Colors.blue, fontSize: 18.0),
                ),
                Divider(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
