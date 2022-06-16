
import 'dart:convert';

import 'package:geolocator/geolocator.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:michael/db/shared_preferences.dart';
import 'package:michael/models/bornes.dart';
import 'package:michael/models/humidity.dart';
import 'package:michael/models/my_model.dart';
import 'package:michael/models/my_model.dart';
import 'package:michael/models/note_model.dart';

import 'package:http/http.dart' as http;

import '../const.dart';
import '../models/culture_model.dart';

class DatabaseHelper{
  static Future <void> initDatabase() async{
    Preferences.init();
    await Hive.initFlutter();
    Hive.registerAdapter(MyModelAdapter());
    Hive.registerAdapter(NoteAdapter());
    Hive.registerAdapter(CultureAdapter());
    Hive.registerAdapter(BornesAdapter());
    print("Initialise la base de données ici");
  }

  static Future <void> saveData(MyModel model) async{
    int id = await Preferences.getIntValue(keyCount)?? 0;
    await Preferences.setIntValue(keyCount, id+1);
    final box= await Hive.openBox<MyModel>(kHiveModel);

    box.add(model);
  }
  static Future<List<MyModel>> getAllModels() async{
    final box= await Hive.openBox<MyModel>(kHiveModel);
    return box.values.toList();
  }

  static Future <void> saveNoteData(String name, String title, String desc, String date) async{
    int id= await Preferences.getIntValue(keyCurrentChamp)?? 0;
    final box= await Hive.openBox<Note>(kHiveNoteModel);
    box.add(Note.fromMap({"champ_id": id,"name": name, "title": title, "description":desc, "date": date}));
  }

  static Future<List<Note>> getAllNoteModels() async{
    final box= await Hive.openBox<Note>(kHiveNoteModel);
    int id= await Preferences.getIntValue(keyCurrentChamp)?? 0;
    return box.values.where((Note)=> Note.champ_id==id).toList();
  }
  static Future <void> saveCultureData(String name, String type, String champs, String date) async{
    int id= await Preferences.getIntValue(keyCurrentChamp)?? 0;
    final box= await Hive.openBox<Culture>(kHiveCultureModel);
    box.add(Culture.fromMap({"champ_id": id,"name": name, "type": type, "champs":champs, "date": date}));
  }

  static Future<List<Culture>> getAllCultureModels() async{
    final box= await Hive.openBox<Culture>(kHiveCultureModel);
    int id= await Preferences.getIntValue(keyCurrentChamp)?? 0;
    return box.values.where((Culture)=> Culture.champ_id==id).toList();
  }

  static Future<void> deleteCulture(Culture culture) async{
    final box= await Hive.openBox<Culture>(kHiveCultureModel);
    dynamic deleteKey;
    final Map<dynamic, Culture> map= box.toMap();
    map.forEach((key, value) {
      if(culture==value){
        deleteKey=key;
      }
    });
    box.delete(deleteKey);
  }
  static Future<void> deleteNote(Note note) async{
    final box= await Hive.openBox<Note>(kHiveNoteModel);
    dynamic deleteKey;
    final Map<dynamic, Note> map= box.toMap();
    map.forEach((key, value) {
      if(note==value){
        deleteKey=key;
      }
    });
    box.delete(deleteKey);
  }
  static Future<void> deleteChamp(int index) async{
    final box= await Hive.openBox<MyModel>(kHiveModel);
    box.deleteAt(index);
  }
  static Future<Position> determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }
    return await Geolocator.getCurrentPosition();
  }

  static Future <void> saveBorne(Bornes borne) async{
    int id= await Preferences.getIntValue(keyCurrentChamp)?? 0;
    borne.champ_id= id;
    final box= await Hive.openBox<Bornes>(kHiveBorneModel);
    box.add(Bornes.fromMap({"champ_id": id,"lon": borne.lon, "lat": borne.lat}));
  }

  static Future<List<Bornes>> getAllBorneModels() async{
    final box= await Hive.openBox<Bornes>(kHiveBorneModel);
    return box.values.toList();
  }

  static Future<void> deleteBorne(Bornes borne) async{
    final box= await Hive.openBox<Note>(kHiveBorneModel);
    dynamic deleteKey;
    final Map<dynamic, Note> map= box.toMap();
    map.forEach((key, value) {
      if(borne==value){
        deleteKey=key;
      }
    });
    box.delete(deleteKey);
  }

  static Future<Humidity> getHumidity(double lat, double lon)async{
    Humidity humidity;
    try {
      var response = await http.get(Uri.parse("https://api.openweathermap.org/data/2.5/weather?lat=${lat}&lon=${lon}&appid=dbbde5c2cae1413c98aa7270aa90740e"),);
      var response_json=json.decode(response.body);
      print(response_json);
      humidity= new Humidity(response_json["main"]["humidity"], double.parse("${response_json["main"]["pressure"]}"), double.parse("${response_json["main"]["temp"]}"));
      return humidity;

    }catch(e){
      print('Pas d\'internet ${e}');
      humidity= new Humidity(-1500, -1500, -1500);
      return humidity ;
    }
  }






}