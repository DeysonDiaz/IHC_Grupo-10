import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'dart:async';
import 'song_information.dart';
import 'song_screen.dart';
import 'package:music_fit/Model/song.dart';
import 'package:music_fit/main.dart';
import 'package:music_fit/generated/l10n.dart';

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
    //TODO: implement initState
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
      home: Scaffold(
        appBar: AppBar(
          title: Text(AppLocalizations.of(context).songs),
          centerTitle: true,
          backgroundColor: Colors.green,
          actions: <Widget>[
            IconButton(
              icon: Icon(
                Icons.exit_to_app,
                color: Colors.white,
              ),
              onPressed: () => _login(context),
            )
          ],
        ),
        drawer: Drawer(
          child: ListView(
            children: <Widget>[
              UserAccountsDrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.green,
                ),
                accountName: Text("Test"),
                accountEmail: Text("test_email@example.com"),
                currentAccountPicture: CircleAvatar(
                    backgroundColor: Colors.purple,
                    child: Text("T",
                        style: TextStyle(
                          fontSize: 40,
                        ))),
              ),
              ListTile(
                title: Text("Estadísticas generales"),
                leading: Icon(Icons.bar_chart),
                onTap: () {
                  Navigator.of(context).pushNamed('/grafica1');
                },
              ),
              ListTile(
                title: Text("Tipo de ejercicio"),
                leading: Icon(Icons.pie_chart),
                onTap: () {
                  Navigator.of(context).pushNamed('/grafica2'); 
                },
              ),
              ListTile(
                title: Text("Cancion mas escuchada"),
                leading: Icon(Icons.library_music_outlined),
                onTap: () {
                  Navigator.of(context).pushNamed('/grafica3');
                },
              ),
              ListTile(
                title: Text("Uso de la Aplicación"),
                leading: Icon(Icons.mobile_screen_share),
                onTap: () {
                  Navigator.of(context).pushNamed('/grafica4');
                },
              ),
              ListTile(
                title: Text("Calorias quemadas"),
                leading: Icon(Icons.directions_run),
                onTap: () {
                  Navigator.of(context).pushNamed('/grafica5');
                },
              ),
            ],
          ),
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
                              color: Colors.purple,
                              fontSize: 21.0,
                            ),
                          ),
                          subtitle: Text('${items[position].artista}',
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 18.0,
                              )),
                          leading: Column(
                            children: <Widget>[
                              CircleAvatar(
                                backgroundColor: Colors.purple,
                                radius: 17.0,
                                child: Text(
                                  '${position + 1}',
                                  style: TextStyle(
                                    color: Colors.white,
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
                          icon: Icon(Icons.edit, color: Colors.blueAccent),
                          onPressed: () =>
                              _navigateToSong(context, items[position])),
                      IconButton(
                        icon: Icon(Icons.delete, color: Colors.red),
                        onPressed: () => _showDialog(context, position),
                      ),
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
          backgroundColor: Colors.green,
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
          title: Text(AppLocalizations.of(context).alert),
          content: Text(AppLocalizations.of(context).alertquestion),
          actions: <Widget>[
            new FlatButton(
              child: Text(AppLocalizations.of(context).btndelete,
                  style: TextStyle(color: Colors.red)),
              onPressed: () => _deleteSong(
                context,
                items[position],
                position,
              ),
            ),
            new FlatButton(
              child: Text(AppLocalizations.of(context).btncancel),
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
      MaterialPageRoute(builder: (context) => SongInformation(song)),
    );
  }

  void _navigateToSong(BuildContext context, Song song) async {
    await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => SongScreen(song)),
    );
  }

  void _createNewSong(BuildContext context) async {
    await Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => SongScreen(Song(null, '', '', '', '', ''))),
    );
  }

  _login(BuildContext context) async {
    await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => MyHomePage()),
    );
  }
}
