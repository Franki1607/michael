import 'package:flutter/material.dart';


class Tache extends StatefulWidget {
  String name;//
  String type; //
  String champs;
  String date;

  Tache(this.name, this.type, this.champs, this.date);

  @override
  _TacheState createState() => _TacheState();
}

class _TacheState extends State<Tache> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tache à faire "),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            Text("Nom : ${widget.name}"),
            SizedBox(
              height: 15,
            ),
            Text("Titre : ${widget.type}"),
            SizedBox(
              height: 15,
            ),
            Text("Description: ${widget.champs}"),
            SizedBox(
              height: 15,
            ),
            Text("Name : ${widget.date}"),
            SizedBox(
              height: 15,
            ),


          ],
        ),
      ),
    );
  }
}
