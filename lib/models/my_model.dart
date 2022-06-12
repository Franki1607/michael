import 'package:hive/hive.dart';

part 'my_model.g.dart';
@HiveType(typeId: 0)
class MyModel{
  @HiveField(0)
  int id;
  @HiveField(1)
  String p_firstname;
  @HiveField(2)
  String p_lastname;
  @HiveField(3)
  String p_sexe;
  @HiveField(4)
  String p_adresse;
  @HiveField(5)
  String p_tel;
  @HiveField(6)
  String d_name;
  @HiveField(7)
  String d_superficie;
  @HiveField(8)
  String d_departement;
  @HiveField(9)
  String d_commune;
  @HiveField(10)
  String d_localite;
  @HiveField(11)
  String b_longitude;
  @HiveField(12)
  String b_latitude;


  MyModel(
      this.id,
      this.p_firstname,
      this.p_lastname,
      this.p_sexe,
      this.p_adresse,
      this.p_tel,
      this.d_name,
      this.d_superficie,
      this.d_departement,
      this.d_commune,
      this.d_localite,
      this.b_longitude,
      this.b_latitude);

  factory MyModel.fromMap(Map<String, dynamic> json)=> MyModel(
      json['id'],
      json['p_firstname'],
      json['p_lastname'],
      json['p_sexe'],
      json['p_adresse'],
      json['p_tel'],
      json['d_name'],
      json['d_superficie'],
      json['d_departement'],
      json['d_commune'],
      json['d_localite'],
      json['b_longitude'],
      json['b_latitude'],
  );
  Map <String, dynamic> toMap()=>{
    'id': id,
    'p_firstname': p_firstname,
    'p_lastname': p_lastname,
    'p_sexe': p_sexe,
    'p_adresse': p_adresse,
    'p_tel': p_tel,
    'd_name': d_name,
    'd_superficie': d_superficie,
    'd_departement': d_departement,
    'd_commune': d_commune,
    'd_localite': d_localite,
    'b_longitude': b_longitude,
    'b_latitude': b_latitude,
  };
}