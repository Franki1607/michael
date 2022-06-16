import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:geolocator/geolocator.dart';
import 'package:michael/db/database_helper.dart';
import 'package:michael/models/bornes.dart';
import 'package:michael/models/humidity.dart';

late Bornes borne;
late Humidity humidity= Humidity(-100000000, -100000000, -100000000);
List<Bornes> bornes=[];
final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
TextEditingController b_lon= new TextEditingController();
TextEditingController b_lat= new TextEditingController();
class BornePage extends StatefulWidget {
  const BornePage({Key? key}) : super(key: key);

  @override
  _BornePageState createState() => _BornePageState();
}

class _BornePageState extends State<BornePage> {
  @override
  void initState() {
    borne= new Bornes(0, 0, 0);
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Mes bornes"),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context)=>AddBorne())).then((value){
            setState(() {

            });
          });
        },
      ),
      body: FutureBuilder(
        future: DatabaseHelper.getAllBorneModels(),
        builder: (context, snapshot){
          if(snapshot.hasData){
            bornes= snapshot.data as List<Bornes>;
          }
          return
          !snapshot.hasData?
          Center(child: CircularProgressIndicator()):
          ListView.builder(
            itemCount: bornes.length,
            itemBuilder: (context, index){
              return InkWell(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>ShowBornePage(bornes[index].lat, bornes[index].lon)));
                },
                child: Padding(
                  padding: EdgeInsets.all(8),
                  child: Container(
                    height: 100,
                    color: Colors.grey,
                    child: Row(
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text("Borne $index", overflow: TextOverflow.ellipsis,),
                            Text("Longitude:  ${bornes[index].lon}", overflow: TextOverflow.ellipsis,),
                            Text("Latitude:  ${bornes[index].lat}", overflow: TextOverflow.ellipsis,),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

class AddBorne extends StatefulWidget {
  const AddBorne({Key? key}) : super(key: key);

  @override
  _AddBorneState createState() => _AddBorneState();
}

class _AddBorneState extends State<AddBorne> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Ajouter borne"),
      ),
      body: Form(
        key: _formKey,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(Icons.add_location),
                SizedBox(width: 10,),
                InkWell(onTap: () async{
                  await DatabaseHelper.determinePosition().then((value){
                    Position pos= value;
                    b_lon.text="${pos.longitude}";
                    b_lat.text="${pos.latitude}";
                  });
                },child: Text("Ma position actuel"))
              ],
            ),
            SizedBox(
              height: 30,
            ),
            Padding(
              padding: EdgeInsets.only(left: 40, right: 40),
              child: TextFormField(
                controller: b_lon,
                validator: (text){
                  if(text!.trim().length<6)return 'Vous devez entrer au minimum 06 caractères';
                  else return null;
                },

                // POUR LE NOM DU CHAMPS
                decoration: InputDecoration(
                  label: Text("Longitude",
                    style: TextStyle(color: Colors.green, ),),
                  // hintText: ' Donnez un nom a votre champs ',
                  hintStyle: TextStyle(color: Colors.green),
                  focusColor: Colors.green,
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Padding(
              padding: EdgeInsets.only(left: 40, right: 40),
              child: TextFormField(
                controller: b_lat,
                validator: (text){
                  if(text!.trim().length<6)return 'Vous devez entrer au minimum 06 caractères';
                  else return null;
                },

                // POUR LE NOM DU CHAMPS
                decoration: InputDecoration(
                  label: Text("Latitude",
                    style: TextStyle(color: Colors.green, ),),
                  // hintText: ' Donnez un nom a votre champs ',
                  hintStyle: TextStyle(color: Colors.green),
                  focusColor: Colors.green,
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            ElevatedButton(onPressed: (){
              if(_formKey.currentState!.validate()){
                borne.lat= double.parse(b_lat.text);
                borne.lon= double.parse(b_lon.text);
                DatabaseHelper.saveBorne(borne);
                Navigator.pop(context);
              }
            }, child: Text("Sauvegader"))
          ],
        ),
      ),
    );
  }
}

class ShowBornePage extends StatefulWidget {
  double lat;
  double lon;
  ShowBornePage(this.lat, this.lon);

  @override
  _ShowBornePageState createState() => _ShowBornePageState();
}

class _ShowBornePageState extends State<ShowBornePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Info"),
      ),
      body: FutureBuilder(
        future: DatabaseHelper.getHumidity(widget.lat, widget.lon),
        builder: (context, snapshot) {
          if(snapshot.hasData){
            humidity= snapshot.data as Humidity;
          }
          return
          !snapshot.hasData?
          Center(child: CircularProgressIndicator()):
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text("Humidity : ${humidity.humidity}"),
              SizedBox(
                height: 10,
              ),
              Text("Pression : ${humidity.pression}"),
              SizedBox(
                height: 10,
              ),
              Text("Température : ${humidity.temperature} °F"),
              SizedBox(
                height: 10,
              ),

            ],
          );
        }
      ),
    );
  }
}


