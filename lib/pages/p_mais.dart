import 'package:flutter/material.dart';

import 'informationGenerale.dart';
import 'mesCultures.dart';


class p_mais extends StatefulWidget {
  late String name;//
  late String type; //
  late String champs;
  late String date;

  p_mais(this.name, this.type, this.champs, this.date);

  @override
  _p_maisState createState() => _p_maisState();
}

class _p_maisState extends State<p_mais> {
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
                      image: AssetImage("assets/images/noucu.jpg"),
                      height: 350,
                      width: 400,
                      fit: BoxFit.cover,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            " Cotonou ",style: TextStyle(
                            fontSize: 32,color: Colors.white,
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
                    Icons.account_tree,
                    color: Colors.green,
                  ),
                  onPressed: () => {

                  },
                  label: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        "1er Saclage",
                        style: const TextStyle(
                            fontSize: 26,
                            color: Colors.blueGrey),
                      ),

                      Text(
                        "",
                        style: const TextStyle(
                            fontSize: 16,
                            color: Colors.green),
                      ),
                    ],
                  ),
                  style: ElevatedButton.styleFrom(
                    primary: Color.fromARGB(255, 255, 255, 255),
                    fixedSize: const Size(408, 203),
                  ),
                ),

                //

                ElevatedButton.icon(
                  icon: const Icon(
                    Icons.account_tree,
                    color: Colors.green,
                  ),
                  onPressed: () => {

                  },
                  label: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        "2ème Saclage",
                        style: const TextStyle(
                            fontSize: 26,
                            color: Colors.blueGrey),
                      ),

                      Text(
                        "",
                        style: const TextStyle(
                            fontSize: 16,
                            color: Colors.green),
                      ),
                    ],
                  ),
                  style: ElevatedButton.styleFrom(
                    primary: Color.fromARGB(255, 255, 255, 255),
                    fixedSize: const Size(408, 203),
                  ),
                ),
                //
                ElevatedButton.icon(
                  icon: const Icon(
                    Icons.account_tree,
                    color: Colors.green,
                  ),
                  onPressed: () => {

                  },
                  label: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        "Semence D'engrais Saclage",
                        style: const TextStyle(
                            fontSize: 26,
                            color: Colors.blueGrey),
                      ),

                      Text(
                        "",
                        style: const TextStyle(
                            fontSize: 16,
                            color: Colors.green),
                      ),
                    ],
                  ),
                  style: ElevatedButton.styleFrom(
                    primary: Color.fromARGB(255, 255, 255, 255),
                    fixedSize: const Size(408, 203),
                  ),
                )
              ],
            ),

//              pour Culture

            //

          ],
        ),

      ),



    );
  }
}
