// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values

class AppLocalizations {
  AppLocalizations();
  
  static AppLocalizations current;
  
  static const AppLocalizationDelegate delegate =
    AppLocalizationDelegate();

  static Future<AppLocalizations> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false) ? locale.languageCode : locale.toString();
    final localeName = Intl.canonicalizedLocale(name); 
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      AppLocalizations.current = AppLocalizations();
      
      return AppLocalizations.current;
    });
  } 

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  /// `CORREO`
  String get email {
    return Intl.message(
      'CORREO',
      name: 'email',
      desc: '',
      args: [],
    );
  }

  /// `CONTRASEÑA`
  String get password {
    return Intl.message(
      'CONTRASEÑA',
      name: 'password',
      desc: '',
      args: [],
    );
  }

  /// `¿Olvido su contraseña?`
  String get btnquestion {
    return Intl.message(
      '¿Olvido su contraseña?',
      name: 'btnquestion',
      desc: '',
      args: [],
    );
  }

  /// `Iniciar Sesión`
  String get btnlogin {
    return Intl.message(
      'Iniciar Sesión',
      name: 'btnlogin',
      desc: '',
      args: [],
    );
  }

  /// `¿No tienes una cuenta?`
  String get question2 {
    return Intl.message(
      '¿No tienes una cuenta?',
      name: 'question2',
      desc: '',
      args: [],
    );
  }

  /// `Registrate`
  String get btnregistration {
    return Intl.message(
      'Registrate',
      name: 'btnregistration',
      desc: '',
      args: [],
    );
  }

  /// `Recuperar contraseña`
  String get recovery {
    return Intl.message(
      'Recuperar contraseña',
      name: 'recovery',
      desc: '',
      args: [],
    );
  }

  /// `Se envió un código de recuperación a su correo`
  String get text {
    return Intl.message(
      'Se envió un código de recuperación a su correo',
      name: 'text',
      desc: '',
      args: [],
    );
  }

  /// `CÓDIGO`
  String get code {
    return Intl.message(
      'CÓDIGO',
      name: 'code',
      desc: '',
      args: [],
    );
  }

  /// `Recuperar`
  String get btnrecover {
    return Intl.message(
      'Recuperar',
      name: 'btnrecover',
      desc: '',
      args: [],
    );
  }

  /// `Atrás`
  String get btnback {
    return Intl.message(
      'Atrás',
      name: 'btnback',
      desc: '',
      args: [],
    );
  }

  /// `Registro`
  String get register {
    return Intl.message(
      'Registro',
      name: 'register',
      desc: '',
      args: [],
    );
  }

  /// `NOMBRE`
  String get name {
    return Intl.message(
      'NOMBRE',
      name: 'name',
      desc: '',
      args: [],
    );
  }

  /// `Registrarse`
  String get btnregister {
    return Intl.message(
      'Registrarse',
      name: 'btnregister',
      desc: '',
      args: [],
    );
  }

  /// `Canciones`
  String get songs {
    return Intl.message(
      'Canciones',
      name: 'songs',
      desc: '',
      args: [],
    );
  }

  /// `Canción`
  String get song {
    return Intl.message(
      'Canción',
      name: 'song',
      desc: '',
      args: [],
    );
  }

  /// `Nombre`
  String get songname {
    return Intl.message(
      'Nombre',
      name: 'songname',
      desc: '',
      args: [],
    );
  }

  /// `Artista(s)`
  String get songartist {
    return Intl.message(
      'Artista(s)',
      name: 'songartist',
      desc: '',
      args: [],
    );
  }

  /// `Álbum`
  String get songalbum {
    return Intl.message(
      'Álbum',
      name: 'songalbum',
      desc: '',
      args: [],
    );
  }

  /// `Duración`
  String get songduration {
    return Intl.message(
      'Duración',
      name: 'songduration',
      desc: '',
      args: [],
    );
  }

  /// `Año`
  String get songyear {
    return Intl.message(
      'Año',
      name: 'songyear',
      desc: '',
      args: [],
    );
  }

  /// `Agregar`
  String get btnadd {
    return Intl.message(
      'Agregar',
      name: 'btnadd',
      desc: '',
      args: [],
    );
  }

  /// `Actualizar`
  String get btntoupdate {
    return Intl.message(
      'Actualizar',
      name: 'btntoupdate',
      desc: '',
      args: [],
    );
  }

  /// `Alerta`
  String get alert {
    return Intl.message(
      'Alerta',
      name: 'alert',
      desc: '',
      args: [],
    );
  }

  /// `¿Quiere eliminar esta canción?`
  String get alertquestion {
    return Intl.message(
      '¿Quiere eliminar esta canción?',
      name: 'alertquestion',
      desc: '',
      args: [],
    );
  }

  /// `Eliminar`
  String get btndelete {
    return Intl.message(
      'Eliminar',
      name: 'btndelete',
      desc: '',
      args: [],
    );
  }

  /// `Cancelar`
  String get btncancel {
    return Intl.message(
      'Cancelar',
      name: 'btncancel',
      desc: '',
      args: [],
    );
  }

  /// `Información de la canción`
  String get information {
    return Intl.message(
      'Información de la canción',
      name: 'information',
      desc: '',
      args: [],
    );
  }

  /// `Nombre: {name}`
  String informationname(Object name) {
    return Intl.message(
      'Nombre: $name',
      name: 'informationname',
      desc: '',
      args: [name],
    );
  }

  /// `Artista: {artist}`
  String informationartist(Object artist) {
    return Intl.message(
      'Artista: $artist',
      name: 'informationartist',
      desc: '',
      args: [artist],
    );
  }

  /// `Álbum: {album}`
  String informationalbum(Object album) {
    return Intl.message(
      'Álbum: $album',
      name: 'informationalbum',
      desc: '',
      args: [album],
    );
  }

  /// `Duración: {duration}`
  String informationduration(Object duration) {
    return Intl.message(
      'Duración: $duration',
      name: 'informationduration',
      desc: '',
      args: [duration],
    );
  }

  /// `Año: {year}`
  String informationyear(Object year) {
    return Intl.message(
      'Año: $year',
      name: 'informationyear',
      desc: '',
      args: [year],
    );
  }

  /// `Idioma`
  String get language {
    return Intl.message(
      'Idioma',
      name: 'language',
      desc: '',
      args: [],
    );
  }

  /// `Idioma del sistema`
  String get systemLanguage {
    return Intl.message(
      'Idioma del sistema',
      name: 'systemLanguage',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<AppLocalizations> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'es', countryCode: 'PE'),
      Locale.fromSubtags(languageCode: 'en', countryCode: 'US'),
      Locale.fromSubtags(languageCode: 'pt', countryCode: 'BR'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<AppLocalizations> load(Locale locale) => AppLocalizations.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    if (locale != null) {
      for (var supportedLocale in supportedLocales) {
        if (supportedLocale.languageCode == locale.languageCode) {
          return true;
        }
      }
    }
    return false;
  }
}