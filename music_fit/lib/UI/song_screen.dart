import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:music_fit/Model/song.dart';

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
        title: Text("Canciones"),
        backgroundColor: Colors.deepOrangeAccent,
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
                  style:
                      TextStyle(fontSize: 17.0, color: Colors.deepOrangeAccent),
                  decoration: InputDecoration(
                    icon: Icon(Icons.music_note),
                    labelText: "Nombre",
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 8.0),
                ),
                Divider(),
                TextField(
                  controller: _artistaController,
                  style:
                      TextStyle(fontSize: 17.0, color: Colors.deepOrangeAccent),
                  decoration: InputDecoration(
                    icon: Icon(Icons.person),
                    labelText: "Artista",
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 8.0),
                ),
                Divider(),
                TextField(
                  controller: _albumController,
                  style:
                      TextStyle(fontSize: 17.0, color: Colors.deepOrangeAccent),
                  decoration: InputDecoration(
                    icon: Icon(Icons.album),
                    labelText: "Álbum",
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 8.0),
                ),
                Divider(),
                TextField(
                  controller: _duracionController,
                  style:
                      TextStyle(fontSize: 17.0, color: Colors.deepOrangeAccent),
                  decoration: InputDecoration(
                    icon: Icon(Icons.access_time_rounded),
                    labelText: "Duración",
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 8.0),
                ),
                Divider(),
                TextField(
                  controller: _anioController,
                  style:
                      TextStyle(fontSize: 17.0, color: Colors.deepOrangeAccent),
                  decoration: InputDecoration(
                    icon: Icon(Icons.calendar_today),
                    labelText: "Año",
                  ),
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
                          Navigator.pop(context);
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
                        ? Text('Actualizar')
                        : Text('Agregar')),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
