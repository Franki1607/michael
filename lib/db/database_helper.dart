
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:michael/db/shared_preferences.dart';
import 'package:michael/models/my_model.dart';
import 'package:michael/models/my_model.dart';
import 'package:michael/models/note_model.dart';

import '../const.dart';
import '../models/culture_model.dart';

class DatabaseHelper{
  static Future <void> initDatabase() async{
    Preferences.init();
    await Hive.initFlutter();
    Hive.registerAdapter(MyModelAdapter());
    Hive.registerAdapter(NoteAdapter());
    Hive.registerAdapter(CultureAdapter());
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





}