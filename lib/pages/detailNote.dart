import 'package:flutter/material.dart';


class detailPage extends StatefulWidget {
  String name;//
  String title; //
  String desc;
  String date;

  detailPage(this.name, this.title, this.desc, this.date);

  @override
  _detailPageState createState() => _detailPageState();
}

class _detailPageState extends State<detailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Mes Note "),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            Text("Nom : ${widget.name}"),
            SizedBox(
              height: 15,
            ),
            Text("Titre : ${widget.title}"),
            SizedBox(
              height: 15,
            ),
            Text("Description: ${widget.desc}"),
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
