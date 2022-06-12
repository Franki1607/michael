import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'AjouterNote.dart';
import 'add_page.dart';
import 'informationGenerale.dart';
import 'n_culture.dart';


class Menu extends StatefulWidget {
  @override
  _MenuState createState() => _MenuState();
}
class _MenuState extends State<Menu> {


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
          appBar: AppBar(
            title: Text(' Menu',

              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 28 ,color: Colors.white),),
            backgroundColor: Colors.green,

          ),
          backgroundColor: Colors.green[100],
          //body: new Text("${widget.value}"),

          body: Container(
            padding: EdgeInsets.all(30.0),
            child: GridView.count(
              crossAxisCount: 2,
              children: [

                Card(
                  margin: EdgeInsets.all(8.0),
                  child: InkWell(
                    onTap: (){
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) =>AddPage()));

                    },
                    splashColor: Colors.green,
                    child: Center(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(Icons.account_balance,size: 70.0,
                            color: Colors.brown,),

                          Text("Accuel",style :new TextStyle(fontSize: 17.0))

                        ],
                      ),
                    ),
                  ),
                ),

                //
                Card(
                  margin: EdgeInsets.all(8.0),
                  child: InkWell(
                    onTap: (){
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => InfoScreen()));
                    },
                    splashColor: Colors.green,
                    child: Center(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(Icons.info_outline,size: 70.0,
                            color: Colors.blue,),

                          Text(" Informations Générales",style :new TextStyle(fontSize: 17.0))

                        ],
                      ),
                    ),
                  ),
                ),
                //

                // Information

                Card(
                  margin: EdgeInsets.all(8.0),
                  child: InkWell(
                    onTap: (){
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => n_culture()));
                    },
                    splashColor: Colors.green,
                    child: Center(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(Icons.sports_kabaddi_outlined,size: 70.0,
                            color: Colors.orange,),

                          Text("Semer",style :new TextStyle(fontSize: 17.0))

                        ],
                      ),
                    ),
                  ),
                ),

                //Notifications

                Card(
                  margin: EdgeInsets.all(8.0),
                  child: InkWell(
                    onTap: (){},
                    splashColor: Colors.green,
                    child: Center(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(Icons.announcement_sharp,size: 70.0,
                            color: Colors.green,),

                          Text("Notifications",style :new TextStyle(fontSize: 17.0))

                        ],
                      ),
                    ),
                  ),
                ),
                //
                Card(
                  margin: EdgeInsets.all(8.0),
                  child: InkWell(
                    onTap: (){},
                    splashColor: Colors.green,
                    child: Center(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(Icons.ad_units_sharp ,size: 70.0,
                            color: Colors.blueGrey,),

                          Text("Verifier Humidité",style :new TextStyle(fontSize: 17.0))

                        ],
                      ),
                    ),
                  ),
                ),

                //
                Card(
                  margin: EdgeInsets.all(8.0),
                  child: InkWell(
                    onTap: (){
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => AddNote()));
                    },
                    splashColor: Colors.green,
                    child: Center(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(Icons.library_books ,size: 70.0,
                            color: Colors.teal,),

                          Text("Notes",style :new TextStyle(fontSize: 17.0))

                        ],
                      ),
                    ),
                  ),
                ),
                //

              ],
            ),
          ),
        )
    );
  }
}
