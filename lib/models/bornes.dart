import 'package:hive/hive.dart';

part 'bornes.g.dart';
@HiveType(typeId: 3)
class Bornes{
  @HiveField(0)
  int champ_id;
  @HiveField(1)
  double lon;
  @HiveField(2)
  double lat;

  Bornes(this.champ_id, this.lon, this.lat);

  factory Bornes.fromMap(Map<String, dynamic> json)=> Bornes(
    json['champ_id'],
    json['lon'],
    json['lat'],
  );
  Map <String, dynamic> toMap()=>{
    'champ_id': champ_id,
    'lon': lon,
    'lat': lat,
  };
}