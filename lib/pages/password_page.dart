import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:michael/db/shared_preferences.dart';

import '../const.dart';
import 'main_page.dart';

bool password_hide=true;
String password="";
String password_verify="";
final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
final GlobalKey<FormState> _formKey2 = GlobalKey<FormState>();
class CreatePassword extends StatefulWidget {
  const CreatePassword({Key? key}) : super(key: key);

  @override
  _CreatePasswordState createState() => _CreatePasswordState();
}

class _CreatePasswordState extends State<CreatePassword> {
  @override
  void initState() {
    password_hide= true;
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Mot de passe"),
      ),
      body: Center(
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.only(left: 40, right: 40),
                child: Text("Veuillez définir votre mot de passe"),
              ),
              SizedBox(
                height: 30,
              ),
              Padding(
                padding: EdgeInsets.only(left: 40, right: 40),
                child: TextFormField(
                  onChanged: (text){
                    password=text;
                    print(text);
                  },
                  obscureText: password_hide,
                  validator: (text){
                    if(text!.trim().length<4)return 'Vous devez entrer au minimum 04 caractères';
                    else return null;
                  },

                  // POUR LE NOM DU CHAMPS
                  decoration: InputDecoration(
                    label: Text("Mot de passe",
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
                    suffixIcon: IconButton(
                      icon: Icon((password_hide)? Icons.visibility: Icons.visibility_off),
                      onPressed: (){
                        setState(() {
                          password_hide=!password_hide;
                        });
                      },
                    )
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Padding(
                padding: EdgeInsets.only(left: 40, right: 40),
                child: TextFormField(
                  onChanged: (text){
                    print(text);
                  },
                  validator: (text){
                    if(text!=password)return 'Les mots de passes doivent être identique';
                    else return null;
                  },

                  // POUR LA longitude
                  decoration: InputDecoration(
                    label: Text("Confirmer votre mot de passe",
                      style: TextStyle(color: Colors.green, ),),
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
              ElevatedButton(
                onPressed: (){
                  if(_formKey.currentState!.validate()){
                    Preferences.setStringValue(kUserPassword, password);
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>PutPassword()));
                  }
                },
                child: Text("Valider")
              )
            ],
          ),
        ),
      ),
    );
  }
}

class PutPassword extends StatefulWidget {
  const PutPassword({Key? key}) : super(key: key);

  @override
  _PutPasswordState createState() => _PutPasswordState();
}

class _PutPasswordState extends State<PutPassword> {
  @override
  void initState() {
    // TODO: implement initState
    password_hide=true;
    password_verify= Preferences.getStringValue(kUserPassword) ?? "";
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Mot de passe"),
      ),
      body: Center(
        child: Form(
          key: _formKey2,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.only(left: 40, right: 40),
                child: Text("Veuillez saisir votre mot de passe"),
              ),
              SizedBox(
                height: 30,
              ),
              Padding(
                padding: EdgeInsets.only(left: 40, right: 40),
                child: TextFormField(
                  onChanged: (text){
                  },
                  obscureText: password_hide,
                  validator: (text){
                    if(text!=password_verify)return 'Mot de passe incorrecte';
                    else return null;
                  },
                  decoration: InputDecoration(
                    label: Text("Mot de passe",
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
                    suffixIcon: IconButton(
                      icon: Icon((password_hide)? Icons.visibility: Icons.visibility_off),
                      onPressed: (){
                        setState(() {
                          password_hide=!password_hide;
                        });
                      },
                    )
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              ElevatedButton(
                onPressed: (){
                  if(_formKey2.currentState!.validate()){
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>MainPage()));
                  }
                },
                child: Text("Se connecter")
              )
            ],
          ),
        ),
      ),
    );
  }
}
