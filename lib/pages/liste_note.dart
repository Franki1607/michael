import 'package:flutter/material.dart';

import '../db/database_helper.dart';
import '../main.dart';
import 'AjouterNote.dart';
import 'add_page.dart';
import 'detailNote.dart';

String name="";
String title="";
String desc="";
String date="";
late DateTime? selected;

void main()
{
  runApp(Pnote());

}
class Pnote extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MyHomePage();
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState()
  {
    return _MyHomePageState();
  }
}

class _MyHomePageState extends State<MyHomePage> {
  String date = "";
  DateTime selectedDate = DateTime.now();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(' Prendre une note ',

          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 28,color: Colors.green, ),),
        backgroundColor: Colors.white,

      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(top: 15, right: 10, left: 10),
              child: TextField(
                onChanged: (value){
                  name=value;
                },

                decoration: InputDecoration(
                    hintText: ' Champs  ',
                    hintStyle: TextStyle(color: Colors.green),
                    focusColor: Colors.green


                  //Source: https://prograide.com/pregunta/74817/flutter---comment-changer-la-couleur-de-lindication-dun-champ-de-texte

                ),
                maxLength: 30,
                keyboardType: TextInputType.name,

              ),
            ),
            //Pour Superficie
            Container(
              margin: EdgeInsets.only(top: 15, right: 10, left: 10),
              child: TextField(
                onChanged: (value){
                  title=value;
                },
                decoration: InputDecoration(
                  hintText: 'Cultures ',
                  hintStyle: TextStyle(color: Colors.green),

                ),
                maxLength: 30,
                keyboardType: TextInputType.name,
                // controller: _controller,
              ),
            ),


            // Pour Département
            Container(
              margin: EdgeInsets.only(top: 15, right: 10, left: 10),
              child: TextField(
                onChanged: (value){
                  desc=value;
                },
                decoration: InputDecoration(
                  hintText: 'Description ',
                  hintStyle: TextStyle(color: Colors.green),

                ),
                maxLength: 30,
                keyboardType: TextInputType.name,
                // controller: _controller,
              ),
            ),
            Row(

              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [

                Row(
                  children: [
                    Text("${selectedDate.day}/${selectedDate.month}/${selectedDate.year}",
              style: const TextStyle(
                  fontSize: 26,
                  color: Colors.green
            ),
                    ),
                    ElevatedButton(


                      onPressed: () {
                        _selectDate(context);
                      },
                      child: Text("v",
                        style: const TextStyle(
                          fontSize: 16,
                          color: Colors.green),
                      ),
                      style: ElevatedButton.styleFrom(
                        primary: Colors.white70,
                    ),)

                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      child: Text("Enregistrer",),
                      style: ElevatedButton.styleFrom(
                        primary: Colors.green,
                      ),

                      onPressed: () async{

                        date="${selectedDate.toString().split(" ")[0]}";

                        await DatabaseHelper.saveNoteData(name, title, desc, date).then((value) {
                          Navigator.pop(context);

                        });
                        // Navigator.push(context, MaterialPageRoute(builder: (context)=>SecondPage()));
                      },
                    )
                  ],
                )
              ],
            ),

          ],
        ),

      ),
    );
  }

  _selectDate(BuildContext context) async {
    selected = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2021),
      lastDate: DateTime(2050),
    );
    if (selected != null && selected != selectedDate)
      setState(() {
        selectedDate = selected!;
      });
  }
}