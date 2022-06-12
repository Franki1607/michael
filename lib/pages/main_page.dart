import 'dart:io';

import 'package:flutter/material.dart';
import 'package:michael/db/database_helper.dart';
import 'package:michael/db/shared_preferences.dart';
import 'package:michael/models/my_model.dart';
import 'package:michael/pages/show_page.dart';

import '../const.dart';
import 'add_page.dart';

List<MyModel> allmodels=[];
class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(' Mes Champs',

          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 28,color: Colors.green, ),),
        backgroundColor: Colors.white,

      ),
      body: FutureBuilder(
        future: DatabaseHelper.getAllModels(),
        builder: (context, snapshot) {
          if(snapshot.hasData){
            allmodels=snapshot.data as List<MyModel>;
          }

          return snapshot.hasData?
          allmodels.length==0?
          Center(
            child: Text("Aucun élement pour l'instant"),
          ):
          ListView.builder(
            itemCount: allmodels.length,

            itemBuilder: (context, index){
            return InkWell(
              onTap: () async{
                await Preferences.setIntValue(keyCurrentChamp, allmodels[index].id);
              Navigator.push(context, MaterialPageRoute(builder: (context)=>ShowPage(allmodels[index].d_name, allmodels[index].d_superficie)));
            },
              child: Card(
                child: Column(
                  children: [
                    Container(
                      height: 200,
                      child: Stack(
                        alignment: AlignmentDirectional.topEnd,
                        children: [
                          IconButton(onPressed: (){
                            AlertDialog dialog= AlertDialog(
                              content: Text("Voulez vous vraiment supprimer le champs ${allmodels[index].d_name} ? Cette action est irréversible."),
                              actions: [
                                TextButton(onPressed: () async{
                                  Navigator.pop(context);
                                  await DatabaseHelper.deleteChamp(index).then((value){
                                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Champs ${allmodels[index].d_name} supprimé")));
                                    setState(() {

                                    });
                                  });

                                }, child: Text("Oui, je supprime"),  ),
                                TextButton(onPressed: () async{
                                  Navigator.pop(context);

                                }, child: Text("Non, fermer"),  ),

                              ],
                            );
                            showDialog(context: context, builder: (_)=>dialog);

                          }, icon: Icon(Icons.delete_rounded, color: Colors.red,)),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Center(
                                child: Image.asset("assets/images/general.jpg"),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(

                          child: Text("${allmodels[index].d_name}, ${allmodels[index].d_superficie} m²", style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              ),
            );
          }):
          Center(
            child: CircularProgressIndicator(),
          );
        }
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.green,
        child: Icon(Icons.add),
        onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context )=>AddPage())).then((value){
            setState(() {

            });
          });
        },
      ),
    );
  }
}
