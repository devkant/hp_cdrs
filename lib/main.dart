//change this commited in Login Page
import 'package:shared_preferences/shared_preferences.dart';
import "package:flutter/material.dart";
import 'package:hp_cdrs/app_screens/loginPage.dart';
import 'package:hp_cdrs/app_screens/splashScreen.dart';
import 'package:hp_cdrs/app_screens/homeScreen.dart';
import 'package:hp_cdrs/connectionStatus.dart';

/*void main() =>  runApp(MyApp());

class MyApp extends StatelessWidget {
  var _splashShown = false;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      title: "CDRS",
      routes: <String,WidgetBuilder>{
        "/LoginPage" :(BuildContext context)  =>  LoginPage(),
      },
      home: SplashScreen(),
    );
  }


}*/


Future<void> main() async {
  ConnectionStatusSingleton connectionStatus = ConnectionStatusSingleton.getInstance();
  connectionStatus.initialize();

  SharedPreferences prefs = await SharedPreferences.getInstance();
  var name = prefs.getString('LastUser');
  var role  = prefs.getString('LastUserId');
  print(name);
  runApp(MaterialApp(home: name == null ? LoginPage() : HomeScreen(role)));
}




