import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:music_fit/Model/song.dart';
import 'package:music_fit/generated/l10n.dart';

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
        title: Text("Informacion de la Canción"),

        backgroundColor: Colors.green,
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
                  //AppLocalizations.of(context).songinformationname(widget.song.nombre),
                  style: TextStyle(color: Colors.green, fontSize: 18.0),
                ),
                Divider(),
                new Text(
                  "Artista: ${widget.song.artista}",
                  //AppLocalizations.of(context).songinformationartist(widget.song.artista),
                  style: TextStyle(color: Colors.green, fontSize: 18.0),
                ),
                Divider(),
                new Text(
                  "Álbum: ${widget.song.album}",
                  //AppLocalizations.of(context).songinformationalbum(widget.song.album),
                  style: TextStyle(color: Colors.green, fontSize: 18.0),
                ),
                Divider(),
                new Text(
                  "Duración: ${widget.song.duracion}",
                  //AppLocalizations.of(context).songinformationduration(widget.song.duracion),
                  style: TextStyle(color: Colors.green, fontSize: 18.0),
                ),
                Divider(),
                new Text(
                  "Año: ${widget.song.anio}",
                  //AppLocalizations.of(context) .songinformationyear(widget.song.anio),
                  style: TextStyle(color: Colors.green, fontSize: 18.0),
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
