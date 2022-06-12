import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class n_culture extends StatefulWidget {
  @override
  _n_cultureState createState() => _n_cultureState();


}

class _n_cultureState extends State<n_culture> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        title: Text(' Mais',

        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 28,color: Colors.green, ),),
    backgroundColor: Colors.white,
        )


    );
  }
}