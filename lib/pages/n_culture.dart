import 'dart:io';

import 'package:flutter/material.dart';
import 'package:michael/db/database_helper.dart';
import 'package:michael/models/culture_model.dart';
import '../models/note_model.dart';
import 'add_page.dart';
import 'liste_note.dart';
import 'f_nculture.dart';
import 'p_mais.dart';
List<Culture> allmodels=[];
class n_culture extends StatefulWidget {
  @override
  _n_cultureState createState() => _n_cultureState();


}

class _n_cultureState extends State<n_culture> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(' Mes Produtions',

          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 28,color: Colors.green, ),),
        backgroundColor: Colors.white,

      ),
      body: FutureBuilder(
          future: DatabaseHelper.getAllCultureModels(),
          builder: (context, snapshot) {
            if(snapshot.hasData){
              allmodels=snapshot.data as List<Culture>;
            }

            return snapshot.hasData?
            allmodels.length==0?
            Center(
              child: Text("Aucun élement pour l'instant"),
            ):
            ListView.builder(
                itemCount: allmodels.length,

                itemBuilder: (context, index){
                  return  Stack(
                      children: [
                        ElevatedButton.icon(
                          icon: const Icon(
                            Icons.note_add_sharp,
                            color: Colors.blueGrey,
                          ),
                          onPressed: () => {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => p_mais(allmodels[index].name, allmodels[index].type, allmodels[index].champs, allmodels[index].date)))
                          },
                          label: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text(
                                "Date : ${allmodels[index].date}",
                                style: const TextStyle(
                                    fontSize: 26,
                                    color: Colors.green),
                              ),

                              Text(
                                "Nom : ${allmodels[index].name}",
                                style: const TextStyle(
                                    fontSize: 16,
                                    color: Colors.green),
                              ),
                            ],
                          ),
                          style: ElevatedButton.styleFrom(
                            primary: Color.fromARGB(255, 255, 255, 255),
                            fixedSize: const Size(408, 103),
                          ),
                        ),
                        Positioned(
                          // The Positioned widget is used to position the text inside the Stack widget
                          bottom: 0,
                          right: 0,

                          child: Container(
                            // We use this Container to create a black box that wraps the white text so that the user can read the text even when the image is white
                            width: 350,
                            color: Colors.blueGrey,
                            padding: const EdgeInsets.all(5),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Text(
                                  "Type : ${allmodels[index].type}",
                                  style: TextStyle(fontSize: 20, color: Colors.white,),
                                ),
                                const Text(
                                  '    ',
                                  style: TextStyle(fontSize: 20, color: Colors.white,),
                                ),
                              ],

                            ),
                          ),
                        ),
                        Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: IconButton(onPressed: (){
                              AlertDialog dialog= AlertDialog(
                                content: Text("Voulez vous vraiment supprimer  définitivement  ${allmodels[index].name} ? "),
                                actions: [
                                  TextButton(onPressed: () async{
                                    Navigator.pop(context);
                                    await DatabaseHelper.deleteCulture(allmodels[index]).then((value){
                                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Note ${allmodels[index].name} supprimée")));
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
                            }, icon: Icon(Icons.delete_rounded, color: Colors.red,
                            ))

                        ),

                      ]

                  );


                  return InkWell(
                      onTap: (){
                        // Navigator.push(context, MaterialPageRoute(builder: (context)=> detailPage(allmodels[index].name, allmodels[index].title, allmodels[index].description, allmodels[index].date)));
                      },
                      child:Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          height: 80,
                          decoration: BoxDecoration(
                              color: Colors.grey[300],
                              borderRadius: BorderRadius.circular(8)
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 8),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Column(
                                      children: [
                                        Container(
                                            decoration: BoxDecoration(
                                                color: Colors.blueGrey[300],
                                                borderRadius: BorderRadius.circular(8)
                                            ),
                                            width: MediaQuery.of(context).size.width-85,
                                            child: Text("Nom ", style: TextStyle(fontWeight: FontWeight.bold, overflow: TextOverflow.ellipsis),)),

                                        Container(

                                            width: MediaQuery.of(context).size.width-85,
                                            child: Text("${allmodels[index].name}", style: TextStyle(fontWeight: FontWeight.bold, overflow: TextOverflow.ellipsis),)),

                                      ],
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Container(
                                        width: MediaQuery.of(context).size.width-85,
                                        child: Text("${allmodels[index].type}", style: TextStyle( overflow: TextOverflow.ellipsis),)),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Container(
                                        width: MediaQuery.of(context).size.width-85,
                                        child: Text("${allmodels[index].date}", style: TextStyle(overflow: TextOverflow.ellipsis),)),

                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(right: 8.0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    IconButton(onPressed: (){
                                      AlertDialog dialog= AlertDialog(
                                        content: Text("Voulez vous vraiment supprimer ${allmodels[index].name} ? Cette action est irréversible."),
                                        actions: [
                                          TextButton(onPressed: () async{
                                            Navigator.pop(context);
                                            await DatabaseHelper.deleteCulture(allmodels[index]).then((value){
                                              ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Note ${allmodels[index].name} supprimée")));
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
                                    }, icon: Icon(Icons.delete_rounded, color: Colors.red,))
                                  ],
                                ),
                              )
                            ],
                          ),

                        ),
                      )
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
          Navigator.push(context, MaterialPageRoute(builder: (context )=>f_nculture())).then((value){
            setState(() {

            });
          });
        },
      ),
    );
  }
}
