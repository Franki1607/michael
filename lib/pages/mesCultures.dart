import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'AjouterNote.dart';
import 'informationGenerale.dart';
import 'liste_note.dart';
import 'n_culture.dart';

class CultureScreen extends StatefulWidget {
  @override
  _CultureScreenState createState() => _CultureScreenState();
}

class _CultureScreenState extends State<CultureScreen> {
  TextEditingController _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text(' Mes cultures',

          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 28,color: Colors.green, ),),
        backgroundColor: Colors.white,

      ),
      //body: new Text("${widget.value}"),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [

                Stack(
                  children: [
                    InkWell(
                        splashColor: Colors.black26,
                        onTap: (){

                          print("nouvelle culture");
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => n_culture()));
                        },
                        child: Ink.image(
                          image: AssetImage("assets/images/ncu.jpg"),
                          height: 200,
                          width: 350,
                          fit: BoxFit.cover,

                          child: Text(
                            " ",style: TextStyle(
                            fontSize: 22,color: Colors.greenAccent,
                          ),
                          ),

                        )



                    ),
                    Positioned(
                      // The Positioned widget is used to position the text inside the Stack widget
                      bottom: 0,
                      right: 0,

                      child: Container(
                        // We use this Container to create a black box that wraps the white text so that the user can read the text even when the image is white
                        width: 350,
                        color: Colors.white70,
                        padding: const EdgeInsets.all(15),
                        child: const Text(
                          'Nouvelle culture ',
                          style: TextStyle(fontSize: 50, color: Colors.green,),
                        ),
                      ),
                    )
                  ],
                ),

              ],

            ),

            Stack(
              children: [
                ElevatedButton.icon(
                  icon: const Icon(
                    Icons.sports_kabaddi,
                    color: Colors.green,
                  ),
                  onPressed: () => {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => InfoScreen()))
                  },
                  label: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        "Verifier humidité",
                        style: const TextStyle(
                            fontSize: 26,
                            color: Colors.green),
                      ),

                      Text(
                        "Consulter",
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
                    color: Colors.green,
                    padding: const EdgeInsets.all(5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        const Text(
                          ' Cliquez    ',
                          style: TextStyle(fontSize: 20, color: Colors.white,),
                        ),
                        const Text(
                          ' pour Vérifier   ',
                          style: TextStyle(fontSize: 20, color: Colors.white,),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),





            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [

                Stack(
                  children: [
                    ElevatedButton.icon(
                      icon: const Icon(
                        Icons.add_circle,
                        color: Colors.green,
                      ),
                      onPressed: () => {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => AddNote()))
                      },
                      label: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            "NOTE",
                            style: const TextStyle(
                                fontSize: 26,
                                color: Colors.green),
                          ),

                          Text(
                            "Consulter",
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
                        color: Colors.green,
                        padding: const EdgeInsets.all(5),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            const Text(
                              ' Cliquez pour   ',
                              style: TextStyle(fontSize: 20, color: Colors.white,),
                              overflow: TextOverflow.ellipsis,
                            ),
                            const Text(
                              '  prendre note   ',
                              style: TextStyle(fontSize: 20, color: Colors.white,),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),

              ],
            ),





          ],
        ),
      ),

    );
  }
}
