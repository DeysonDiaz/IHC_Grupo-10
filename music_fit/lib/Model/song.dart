import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';

class Song {
  String _id;
  String _nombre;
  String _artista;
  String _album;
  String _duracion;
  String _anio;

  Song(this._id, this._nombre, this._artista, this._album, this._duracion,
      this._anio);

  Song.map(dynamic obj) {
    this._nombre = obj['nombre'];
    this._artista = obj['artista'];
    this._album = obj['album'];
    this._duracion = obj['duracion'];
    this._anio = obj['anio'];
  }

  String get id => _id;
  String get nombre => _nombre;
  String get artista => _artista;
  String get album => _album;
  String get duracion => _duracion;
  String get anio => _anio;

  Song.fromSnapShot(DataSnapshot snapshot) {
    _id = snapshot.key;
    _nombre = snapshot.value['nombre'];
    _artista = snapshot.value['artista'];
    _album = snapshot.value['album'];
    _duracion = snapshot.value['duracion'];
    _anio = snapshot.value['anio'];
  }
}
