import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'mesCultures.dart';

class InfoScreen extends StatefulWidget {
  @override
  _InfoScreenState createState() => _InfoScreenState();
}

class _InfoScreenState extends State<InfoScreen> {
  TextEditingController _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text(' INFORMATION GENERALE ',

          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 28,color: Colors.green, ),),
        backgroundColor: Colors.white,

      ),
      //body: new Text("${widget.value}"),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
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
                      image: AssetImage("assets/images/maiis.jpg"),
                      height: 120,
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
                    padding: const EdgeInsets.all(10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        const Text(
                          'MAIS ',
                          style: TextStyle(fontSize: 20, color: Colors.green,),
                        ),
                        const Text(
                          'Consulter ',
                          style: TextStyle(fontSize: 15, color: Colors.green,),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),


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
                      image: AssetImage("assets/images/haricot.jpg"),
                      height: 120,
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
                    padding: const EdgeInsets.all(10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        const Text(
                          'Haricot ',
                          style: TextStyle(fontSize: 20, color: Colors.green,),
                        ),
                        const Text(
                          'Consulter ',
                          style: TextStyle(fontSize: 15, color: Colors.green,),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),

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
                      image: AssetImage("assets/images/arachide.jpg"),
                      height: 120,
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
                    padding: const EdgeInsets.all(10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        const Text(
                          'Harachide ',
                          style: TextStyle(fontSize: 20, color: Colors.green,),
                        ),
                        const Text(
                          'Consulter ',
                          style: TextStyle(fontSize: 15, color: Colors.green,),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),

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
                      image: AssetImage("assets/images/sojaa.jpg"),
                      height: 120,
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
                    padding: const EdgeInsets.all(10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        const Text(
                          'SOJA ',
                          style: TextStyle(fontSize: 20, color: Colors.green,),
                        ),
                        const Text(
                          'Consulter ',
                          style: TextStyle(fontSize: 15, color: Colors.green,),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),

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
                      image: AssetImage("assets/images/coton.jpg"),
                      height: 120,
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
                    padding: const EdgeInsets.all(10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        const Text(
                          'Coton ',
                          style: TextStyle(fontSize: 20, color: Colors.green,),
                        ),
                        const Text(
                          'Consulter ',
                          style: TextStyle(fontSize: 15, color: Colors.green,),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),

    );
  }
}
