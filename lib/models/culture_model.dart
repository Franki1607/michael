import 'package:hive/hive.dart';

part 'culture_model.g.dart';
@HiveType(typeId: 2)
class Culture{
  @HiveField(0)
  int champ_id;
  @HiveField(1)
  String name;
  @HiveField(2)
  String type;
  @HiveField(3)
  String champs;
  @HiveField(4)
  String date;


  Culture(this.champ_id, this.name, this.type, this.champs, this.date);

  factory Culture.fromMap(Map<String, dynamic> json)=> Culture(
    json['champ_id'],
    json['name'],
    json['type'],
    json['champs'],
    json['date'],
  );
  Map <String, dynamic> toMap()=>{
    'champ_id': champ_id,
    'name': name,
    'type': type,
    'champs': champs,
    'date': date,
  };
}