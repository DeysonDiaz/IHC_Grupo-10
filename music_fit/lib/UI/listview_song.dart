import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'dart:async';
import 'package:music_fit/UI/song_information.dart';
import 'package:music_fit/UI/song_screen.dart';
import 'package:music_fit/Model/song.dart';

class ListViewSong extends StatefulWidget {
  @override
  _ListViewSongState createState() => _ListViewSongState();
}

final songReference = FirebaseDatabase.instance.reference().child('song');

class _ListViewSongState extends State<ListViewSong> {
  List<Song> items;
  StreamSubscription<Event> _onSongAddedSubscription;
  StreamSubscription<Event> _onSongChangedSubscription;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    items = new List();
    _onSongAddedSubscription = songReference.onChildAdded.listen(_onSongAdded);
    _onSongChangedSubscription =
        songReference.onChildAdded.listen(_onSongUpdate);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _onSongAddedSubscription.cancel();
    _onSongChangedSubscription.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Canciones',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Canciones'),
          centerTitle: true,
          backgroundColor: Colors.deepOrangeAccent,
        ),
        body: Center(
          child: ListView.builder(
            itemCount: items.length,
            padding: EdgeInsets.only(top: 12.0),
            itemBuilder: (context, position) {
              return Column(
                children: <Widget>[
                  Divider(
                    height: 7.0,
                  ),
                  Row(
                    children: <Widget>[
                      Expanded(
                        child: ListTile(
                          title: Text(
                            '${items[position].nombre}',
                            style: TextStyle(
                              color: Colors.blueAccent,
                              fontSize: 21.0,
                            ),
                          ),
                          subtitle: Text('${items[position].artista}',
                              style: TextStyle(
                                color: Colors.blueGrey,
                                fontSize: 21.0,
                              )),
                          leading: Column(
                            children: <Widget>[
                              CircleAvatar(
                                backgroundColor: Colors.amberAccent,
                                radius: 17.0,
                                child: Text(
                                  '${position + 1}',
                                  style: TextStyle(
                                    color: Colors.blueGrey,
                                    fontSize: 21.0,
                                  ),
                                ),
                              )
                            ],
                          ),
                          onTap: () => _navigateToSongInformation(
                              context, items[position]),
                        ),
                      ),
                      IconButton(
                        icon: Icon(Icons.delete, color: Colors.red),
                        onPressed: () => _showDialog(context, position),
                      ),
                      IconButton(
                          icon: Icon(Icons.remove_red_eye,
                              color: Colors.blueAccent),
                          onPressed: () =>
                              _navigateToSong(context, items[position])),
                    ],
                  ),
                ],
              );
            },
          ),
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(
            Icons.add,
            color: Colors.white,
          ),
          backgroundColor: Colors.deepOrangeAccent,
          onPressed: () => _createNewSong(context),
        ),
      ),
    );
  }

  void _showDialog(context, position) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Alerta'),
          content: Text('¿Quiere eliminar esta cancion?'),
          actions: <Widget>[
            new FlatButton(
              child: Text('Eliminar'),
              onPressed: () => _deleteSong(
                context,
                items[position],
                position,
              ),
            ),
            new FlatButton(
              child: Text('Cancelar'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void _onSongAdded(Event event) {
    setState(() {
      items.add(new Song.fromSnapShot(event.snapshot));
    });
  }

  void _onSongUpdate(Event event) {
    var oldSongValue =
        items.singleWhere((song) => song.id == event.snapshot.key);
    setState(() {
      items[items.indexOf(oldSongValue)] =
          new Song.fromSnapShot(event.snapshot);
    });
  }

  void _deleteSong(BuildContext context, Song song, int position) async {
    await songReference.child(song.id).remove().then((_) {
      setState(() {
        items.removeAt(position);
        Navigator.of(context).pop();
      });
    });
  }

  void _navigateToSongInformation(BuildContext context, Song song) async {
    await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => SongScreen(song)),
    );
  }

  void _navigateToSong(BuildContext context, Song song) async {
    await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => SongInformation(song)),
    );
  }

  void _createNewSong(BuildContext context) async {
    await Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => SongScreen(Song(null, '', '', '', '', ''))),
    );
  }
}
