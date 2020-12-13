import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:music_fit/Model/song.dart';
import 'package:music_fit/UI/listview_song.dart';
import 'package:music_fit/generated/l10n.dart';

class SongScreen extends StatefulWidget {
  final Song song;
  SongScreen(this.song);
  @override
  _SongScreenState createState() => _SongScreenState();
}

final songReference = FirebaseDatabase.instance.reference().child('song');

class _SongScreenState extends State<SongScreen> {
  List<Song> items;

  TextEditingController _nombreController;
  TextEditingController _artistaController;
  TextEditingController _albumController;
  TextEditingController _duracionController;
  TextEditingController _anioController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _nombreController = new TextEditingController(text: widget.song.nombre);
    _artistaController = new TextEditingController(text: widget.song.artista);
    _albumController = new TextEditingController(text: widget.song.album);
    _duracionController = new TextEditingController(text: widget.song.duracion);
    _anioController = new TextEditingController(text: widget.song.anio);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        title: Text("Canción"),
        backgroundColor: Colors.green,
      ),
      body: Container(
        height: 570.0,
        padding: const EdgeInsets.all(20.0),
        child: Card(
          child: Center(
            child: Column(
              children: <Widget>[
                TextField(
                  controller: _nombreController,
                  style: TextStyle(fontSize: 17.0, color: Colors.black),
                  decoration: InputDecoration(
                      icon: Icon(Icons.music_note, color: Colors.green),
                      labelText: "Nombre",
                      labelStyle: TextStyle(
                        color: Colors.green,
                      )),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 8.0),
                ),
                Divider(),
                TextField(
                  controller: _artistaController,
                  style: TextStyle(fontSize: 17.0, color: Colors.black),
                  decoration: InputDecoration(
                      icon: Icon(Icons.person, color: Colors.green),
                      labelText: "Artista(s)",
                      labelStyle: TextStyle(
                        color: Colors.green,
                      )),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 8.0),
                ),
                Divider(),
                TextField(
                  controller: _albumController,
                  style: TextStyle(fontSize: 17.0, color: Colors.black),
                  decoration: InputDecoration(
                      icon: Icon(Icons.album, color: Colors.green),
                      labelText: "Álbum",
                      labelStyle: TextStyle(
                        color: Colors.green,
                      )),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 8.0),
                ),
                Divider(),
                TextField(
                  controller: _duracionController,
                  style: TextStyle(fontSize: 17.0, color: Colors.black),
                  decoration: InputDecoration(
                      icon:
                          Icon(Icons.access_time_rounded, color: Colors.green),
                      labelText: "Duración",
                      labelStyle: TextStyle(
                        color: Colors.green,
                      )),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 8.0),
                ),
                Divider(),
                TextField(
                  controller: _anioController,
                  style: TextStyle(fontSize: 17.0, color: Colors.black),
                  decoration: InputDecoration(
                      icon: Icon(Icons.calendar_today, color: Colors.green),
                      labelText: "Año",
                      labelStyle: TextStyle(
                        color: Colors.green,
                      )),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 8.0),
                ),
                Divider(),
                FlatButton(
                    onPressed: () {
                      if (widget.song.id != null) {
                        songReference.child(widget.song.id).set({
                          'nombre': _nombreController.text,
                          'artista': _artistaController.text,
                          'album': _albumController.text,
                          'duracion': _duracionController.text,
                          'anio': _anioController.text,
                        }).then((_) {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    ListViewSong(),
                                fullscreenDialog: true,
                              ));
                          setState(() {});
                        });
                      } else {
                        songReference.push().set({
                          'nombre': _nombreController.text,
                          'artista': _artistaController.text,
                          'album': _albumController.text,
                          'duracion': _duracionController.text,
                          'anio': _anioController.text,
                        }).then((_) {
                          Navigator.pop(context);
                        });
                      }
                    },
                    child: (widget.song.id != null)
                        ? Text(
                            'Actualizar',
                            style: TextStyle(
                                color: Colors.green,
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold),
                          )
                        : Text(
                            'Agregar',
                            style: TextStyle(
                                color: Colors.green,
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold),
                          )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
