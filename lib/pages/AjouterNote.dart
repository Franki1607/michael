import 'dart:io';

import 'package:flutter/material.dart';
import 'package:michael/db/database_helper.dart';

import '../models/note_model.dart';
import 'add_page.dart';
import 'detailNote.dart';
import 'f_nculture.dart';
import 'liste_note.dart';

List<Note> allmodels=[];
class AddNote extends StatefulWidget {
  @override
  _AddNoteState createState() => _AddNoteState();


}

class _AddNoteState extends State<AddNote> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(' Mes Notes',

          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 28,color: Colors.green, ),),
        backgroundColor: Colors.white,

      ),
      body: FutureBuilder(
          future: DatabaseHelper.getAllNoteModels(),
          builder: (context, snapshot) {
            if(snapshot.hasData){
              print(snapshot.data);
              allmodels=snapshot.data as List<Note>;
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
                              builder: (context) => detailPage(allmodels[index].name, allmodels[index].title, allmodels[index].description, allmodels[index].date)))
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
                  "Titre : ${allmodels[index].title}",
                                style: TextStyle(fontSize: 20, color: Colors.white,),
                              ),
                              const Text(
                                ' pour Vérifier   ',
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
                    await DatabaseHelper.deleteNote(allmodels[index]).then((value){
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
          Navigator.push(context, MaterialPageRoute(builder: (context )=>Pnote())).then((value){
            setState(() {

            });
          });
        },
      ),
    );
  }
}
