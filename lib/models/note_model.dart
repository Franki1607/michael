import 'package:hive/hive.dart';

part 'note_model.g.dart';
@HiveType(typeId: 1)
class Note{
  @HiveField(0)
  int champ_id;
  @HiveField(1)
  String name;
  @HiveField(2)
  String title;
  @HiveField(3)
  String description;
  @HiveField(4)
  String date;


  Note(this.champ_id, this.name, this.title, this.description, this.date);

  factory Note.fromMap(Map<String, dynamic> json)=> Note(
    json['champ_id'],
    json['name'],
    json['title'],
    json['description'],
    json['date'],
  );
  Map <String, dynamic> toMap()=>{
    'champ_id': champ_id,
    'name': name,
    'title': title,
    'description': description,
    'date': date,
  };
}