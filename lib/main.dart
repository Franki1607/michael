import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:michael/pages/main_page.dart';
import 'package:michael/pages/password_page.dart';

import 'const.dart';
import 'db/database_helper.dart';
import 'db/shared_preferences.dart';

String profilePath="";
String password_verify="";
final introKey = GlobalKey<IntroductionScreenState>();

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await DatabaseHelper.initDatabase();
  await Preferences.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.lightGreen,

      ),
      home: OnBoardingPage(),
    );
  }
}

class OnBoardingPage extends StatefulWidget {
  const OnBoardingPage({Key? key}) : super(key: key);

  @override
  _OnBoardingPageState createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    password_verify= Preferences.getStringValue(kUserPassword) ?? "";

  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    print("Bye Franklin");
  }
  void _onIntroEnd(context) {
    showDialog(
        context: context,
        builder: (context){
          return AlertDialog(
            title: Text('Important'),
            content: Text("Veuillez definir un mot de passe pour continuer. Ce mot de passe vous sera demandé lors de vos accès à l'application"),
            actions: [
              TextButton(
                  onPressed: (){
                    Navigator.pop(context);
                    Navigator.pop(context);
                    Navigator.of(context).push(
                      MaterialPageRoute(builder: (_) => CreatePassword())
                    );
                  },
                  child: Text("D'accord", textAlign: TextAlign.center,)
              ),

            ],
          );
        });
  }
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    const bodyStyle = TextStyle(fontSize: 19.0);
    const pageDecoration = const PageDecoration(
      titleTextStyle: TextStyle(fontSize: 28.0, fontWeight: FontWeight.w700),
      bodyTextStyle: bodyStyle,
      pageColor: Colors.white,
      imagePadding: EdgeInsets.zero,
    );
    if(password_verify==""){
      return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.lightGreen,

        ),
        debugShowCheckedModeBanner: false,
        home: IntroductionScreen(
          key: introKey,
          globalBackgroundColor: Colors.white,
          pages: [
            PageViewModel(
              title: "Bienvenue",
              body:
              "Nous vous accompagons dans vos cultures",
              image: Padding(
                padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                child: Image.asset('assets/images/maiis.jpg'),
              ),
              decoration: pageDecoration,
            ),
            PageViewModel(
              title: "Cultiver",
              body:
              "Cultivez plus simplement avec nos algorithme",
              image: Padding(
                padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                child: Image.asset('assets/images/maiis.jpg'),
              ),
              decoration: pageDecoration,
            ),
            PageViewModel(
              title: "Controler",
              body:
              "Garder le contrôle de vos domaine grâce à notre application",
              image: Padding(
                padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                child: Image.asset('assets/images/general.jpg'),
              ),
              decoration: pageDecoration,
            ),
            PageViewModel(
              title: "Commencer",
              body:
              "Commencer dès maintenant",
              image: Padding(
                padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                child: Image.asset('assets/images/maiis.jpg'),
              ),
              decoration: pageDecoration,
            ),


          ],
          onDone: () => _onIntroEnd(context),
          //onSkip: () => _onIntroEnd(context), // You can override onSkip callback
          showSkipButton: true,
          nextFlex: 0,
          //rtl: true, // Display as right-to-left
          skip: const Text('Quitter'),
          next: const Icon(Icons.arrow_forward),
          done: const Text('Commencer', style: TextStyle(fontWeight: FontWeight.w600)),
          curve: Curves.fastLinearToSlowEaseIn,
          controlsMargin: const EdgeInsets.all(16),
          controlsPadding: true
              ? const EdgeInsets.all(12.0)
              : const EdgeInsets.fromLTRB(8.0, 4.0, 8.0, 4.0),
          dotsDecorator: const DotsDecorator(
            size: Size(10.0, 10.0),
            activeColor: Colors.lightGreen,
            color: Color(0xFFBDBDBD),
            activeSize: Size(22.0, 10.0),
            activeShape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(25.0)),
            ),
          ),
        ),
      );

    }else{
      return PutPassword();
    }
  }
}

