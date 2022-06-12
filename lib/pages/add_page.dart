import 'dart:io';

import 'package:dropdown_search/dropdown_search.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:michael/db/database_helper.dart';
import 'package:michael/db/shared_preferences.dart';
import 'package:michael/models/my_model.dart';

import '../const.dart';
import '../main.dart';

late String p_firstname;
late String p_lastname;
late String p_sexe;
late String p_adresse;
late String p_tel;
late String d_name;
late String d_superficie;
late String d_departement;
late String d_commune;
late String d_localite;
TextEditingController b_lon= new TextEditingController();
TextEditingController b_lat= new TextEditingController();
final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
class AddPage extends StatefulWidget {
  const AddPage({Key? key}) : super(key: key);

  @override
  _AddPageState createState() => _AddPageState();
}

class _AddPageState extends State<AddPage> {
  get floatingActionButton => null;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    profilePath="";
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
        appBar: AppBar(
          title: Text(' Enregistrer votre domaine ',

            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 28,color: Colors.green, ),),
          backgroundColor: Colors.white,

        ),
        body:CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child:Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 30,
                    ),
                    Text("Info Propriétaire"),
                    SizedBox(
                      height: 30,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 40, right: 40),
                      child: Divider(
                        height: 1,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 40, right: 40),
                      child: TextFormField(
                        onChanged: (text){
                          p_lastname=text;
                        },
                        validator: (text){
                          if(text!.trim().length<6)return 'Vous devez entrer au minimum 06 caractères';
                          else return null;
                        },

                        // POUR LE NOM DU CHAMPS
                        decoration: InputDecoration(
                          label: Text("NOM",
                            style: TextStyle(color: Colors.green, ),),
                          // hintText: ' Donnez un nom a votre champs ',
                          hintStyle: TextStyle(color: Colors.green),
                          focusColor: Colors.green,
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 40, right: 40),
                      child: TextFormField(
                        onChanged: (text){
                          p_firstname=text;
                        },
                        validator: (text){
                          if(text!.trim().length<6)return 'Vous devez entrer au minimum 06 caractères';
                          else return null;
                        },

                        // POUR LE NOM DU CHAMPS
                        decoration: InputDecoration(
                          label: Text("Prénoms",
                            style: TextStyle(color: Colors.green, ),),
                          // hintText: ' Donnez un nom a votre champs ',
                          hintStyle: TextStyle(color: Colors.green),
                          focusColor: Colors.green,
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 40, right: 40),
                      child: DropdownSearch<String>(
                        dropdownSearchDecoration: InputDecoration(
                          label: Text("Sexe",
                            style: TextStyle(color: Colors.green, ),),
                          // hintText: ' Donnez un nom a votre champs ',
                          hintStyle: TextStyle(color: Colors.green),
                          focusColor: Colors.green,
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                        ),
                        validator: (value){
                          if(value!.trim().length<2){
                            return "Selection requis";
                          }
                        },
                        mode: Mode.MENU,
                        items:["Homme", "Femme"],
                        onChanged: (value){
                          p_sexe=value.toString();

                        },
                      )
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 40, right: 40),
                      child: TextFormField(
                        onChanged: (text){
                          p_adresse=text;
                        },
                        validator: (text){
                          if(text!.trim().length<6)return 'Vous devez entrer au minimum 06 caractères';
                          else return null;
                        },

                        // POUR LE NOM DU CHAMPS
                        decoration: InputDecoration(
                          label: Text("Adresse",
                            style: TextStyle(color: Colors.green, ),),
                          // hintText: ' Donnez un nom a votre champs ',
                          hintStyle: TextStyle(color: Colors.green),
                          focusColor: Colors.green,
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 40, right: 40),
                      child: TextFormField(
                        onChanged: (text){
                          p_tel=text;
                        },
                        validator: (text){
                          if(text!.trim().length<6)return 'Vous devez entrer au minimum 06 caractères';
                          else return null;
                        },

                        // POUR LE NOM DU CHAMPS
                        decoration: InputDecoration(
                          label: Text("Telephone",
                            style: TextStyle(color: Colors.green, ),),
                          // hintText: ' Donnez un nom a votre champs ',
                          hintStyle: TextStyle(color: Colors.green),
                          focusColor: Colors.green,
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Text("Info Domaine"),
                    SizedBox(
                      height: 30,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 40, right: 40),
                      child: Divider(
                        height: 1,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 40, right: 40),
                      child: TextFormField(
                        onChanged: (text){
                          d_name=text;
                        },
                        validator: (text){
                          if(text!.trim().length<6)return 'Vous devez entrer au minimum 06 caractères';
                          else return null;
                        },

                        // POUR LE NOM DU CHAMPS
                        decoration: InputDecoration(
                          label: Text("Nom",
                            style: TextStyle(color: Colors.green, ),),
                          // hintText: ' Donnez un nom a votre champs ',
                          hintStyle: TextStyle(color: Colors.green),
                          focusColor: Colors.green,
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 40, right: 40),
                      child: TextFormField(
                        onChanged: (text){
                          d_superficie=text;
                        },
                        validator: (text){
                          if(text!.trim().length<6)return 'Vous devez entrer au minimum 06 caractères';
                          else return null;
                        },

                        // POUR LE NOM DU CHAMPS
                        decoration: InputDecoration(
                          label: Text("Superficie (ha)",
                            style: TextStyle(color: Colors.green, ),),
                          // hintText: ' Donnez un nom a votre champs ',
                          hintStyle: TextStyle(color: Colors.green),
                          focusColor: Colors.green,
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 40, right: 40),
                      child: TextFormField(
                        onChanged: (text){
                          d_departement=text;
                        },
                        validator: (text){
                          if(text!.trim().length<4)return 'Vous devez entrer au minimum 04 caractères';
                          else return null;
                        },

                        // POUR LE NOM DU CHAMPS
                        decoration: InputDecoration(
                          label: Text("Departement",
                            style: TextStyle(color: Colors.green, ),),
                          // hintText: ' Donnez un nom a votre champs ',
                          hintStyle: TextStyle(color: Colors.green),
                          focusColor: Colors.green,
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 40, right: 40),
                      child: TextFormField(
                        onChanged: (text){
                          d_commune=text;
                        },
                        validator: (text){
                          if(text!.trim().length<2)return 'Vous devez entrer au minimum 02 caractères';
                          else return null;
                        },

                        // POUR LE NOM DU CHAMPS
                        decoration: InputDecoration(
                          label: Text("Commune",
                            style: TextStyle(color: Colors.green, ),),
                          // hintText: ' Donnez un nom a votre champs ',
                          hintStyle: TextStyle(color: Colors.green),
                          focusColor: Colors.green,
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 40, right: 40),
                      child: TextFormField(
                        onChanged: (text){
                          d_localite=text;
                        },
                        validator: (text){
                          if(text!.trim().length<6)return 'Vous devez entrer au minimum 06 caractères';
                          else return null;
                        },

                        // POUR LE NOM DU CHAMPS
                        decoration: InputDecoration(
                          label: Text("Localité",
                            style: TextStyle(color: Colors.green, ),),
                          // hintText: ' Donnez un nom a votre champs ',
                          hintStyle: TextStyle(color: Colors.green),
                          focusColor: Colors.green,
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Text("Info borne"),
                    SizedBox(
                      height: 30,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 40, right: 40),
                      child: Divider(
                        height: 1,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(Icons.add_location),
                        SizedBox(width: 10,),
                        InkWell(onTap: () async{
                          await DatabaseHelper.determinePosition().then((value){
                            Position pos= value;
                            b_lon.text="${pos.longitude}";
                            b_lat.text="${pos.latitude}";
                          });
                        },child: Text("Ma position actuel"))
                      ],
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 40, right: 40),
                      child: TextFormField(
                        controller: b_lon,
                        validator: (text){
                          if(text!.trim().length<6)return 'Vous devez entrer au minimum 06 caractères';
                          else return null;
                        },

                        // POUR LE NOM DU CHAMPS
                        decoration: InputDecoration(
                          label: Text("Longitude",
                            style: TextStyle(color: Colors.green, ),),
                          // hintText: ' Donnez un nom a votre champs ',
                          hintStyle: TextStyle(color: Colors.green),
                          focusColor: Colors.green,
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 40, right: 40),
                      child: TextFormField(
                        controller: b_lat,
                        validator: (text){
                          if(text!.trim().length<6)return 'Vous devez entrer au minimum 06 caractères';
                          else return null;
                        },

                        // POUR LE NOM DU CHAMPS
                        decoration: InputDecoration(
                          label: Text("Latitude",
                            style: TextStyle(color: Colors.green, ),),
                          // hintText: ' Donnez un nom a votre champs ',
                          hintStyle: TextStyle(color: Colors.green),
                          focusColor: Colors.green,
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                        ),
                      ),
                    ),

                    SizedBox(
                      height: 30,
                    ),
                    ElevatedButton(onPressed: ()async{
                      if(_formKey.currentState!.validate()){
                        int id = await Preferences.getIntValue(keyCount)?? 0;
                        await Preferences.setIntValue(keyCount, id+1);
                        DatabaseHelper.saveData(MyModel(id, p_firstname, p_lastname,p_sexe, p_adresse, p_tel, d_name, d_superficie, d_departement, d_commune, d_localite, b_lon.text, b_lat.text)).then((value){
                          Navigator.pop(context);
                        });
                        print("Tchin");
                      }else{
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Veuillez svp remplir tous ls champs"),));
                      }
                    }, child: Text("Sauvegarder")),
                    SizedBox(
                      height: 30,
                    ),
                  ],
                ),
              ),
            )
          ],
        )

    );
  }
}
