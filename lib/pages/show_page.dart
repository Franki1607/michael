import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

import 'informationGenerale.dart';
import 'mesCultures.dart';


class ShowPage extends StatefulWidget {
  String d_name;// nom du champs
  String d_supperficie; // superficie


  ShowPage(this.d_name, this.d_supperficie);

  @override
  _ShowPageState createState() => _ShowPageState();
}

class _ShowPageState extends State<ShowPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(


      //body: new Text("${widget.value}"),

      body: Center(

        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [

            Row(
              children: [
                InkWell(
                    splashColor: Colors.black26,
                    onTap: (){

                    },
                    child: Ink.image(
                      image: AssetImage("assets/images/general.jpg"),
                      height: 350,
                      width: MediaQuery.of(context).size.width,
                      fit: BoxFit.cover,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            " Cotonou ",style: TextStyle(
                            fontSize: 32,color: Colors.blueGrey,
                          ),
                          ),
                          //
                          Text(
                            " 25 Avril 2022 ",style: TextStyle(
                            fontSize: 32,color: Colors.blueGrey,
                          ),
                          ),
                          //
                          Text(
                            " 25° ",style: TextStyle(
                             fontSize: 50,color: Colors.blueGrey,
                          ),
                          ),
                          //
                          Text(
                            " Humidité  ",style: TextStyle(
                            fontSize: 32,color: Colors.green,
                          ),
                          ),
                          //
                          //
                          //
                        ],
                      ),

                    )



                ),
                //onPressed: () => {},

              ],
            ),
            Column(
              children: [
                ElevatedButton.icon(
                  icon: const Icon(
                    Icons.add_circle,
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
                        "Information Generale",
                        style: const TextStyle(
                            fontSize: 26,
                            color: Colors.green),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                  style: ElevatedButton.styleFrom(
                    primary: Color.fromARGB(255, 255, 255, 255),
                    fixedSize: const Size(408, 103),
                  ),
                )
              ],
            ),

//              pour Culture

            //
            Stack(
              children: [
                InkWell(
                    splashColor: Colors.black26,
                    onTap: (){
                      print("okkk");
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => CultureScreen()));
                    },
                    child: Ink.image(
                      image: AssetImage("assets/images/procu.jpg"),
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
                  right: 40,

                  child: Container(
                    // We use this Container to create a black box that wraps the white text so that the user can read the text even when the image is white
                    width: 300,
                    color: Colors.green,
                    padding: const EdgeInsets.all(15),
                    child: const Text(
                      'Mes Cultures ',
                      style: TextStyle(fontSize: 20, color: Colors.white,),
                    ),
                  ),
                )
              ],
            )
          ],
        ),

      ),



    );
  }
}
