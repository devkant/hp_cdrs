import 'package:shared_preferences/shared_preferences.dart';
import "package:flutter/material.dart";
import 'package:hp_cdrs/app_screens/loginPage.dart';
import 'package:hp_cdrs/app_screens/splashScreen.dart';
import 'package:hp_cdrs/app_screens/homeScreen.dart';
import 'package:hp_cdrs/connectionStatus.dart';
import 'package:hp_cdrs/common/functions/logoutAuth.dart';
import 'package:hp_cdrs/common/apifunctions/requestLogoutAPI.dart';
import 'package:hp_cdrs/common/functions/saveLogout.dart';



Future<void> main() async {
  ConnectionStatusSingleton connectionStatus = ConnectionStatusSingleton.getInstance();
  connectionStatus.initialize();

  SharedPreferences prefs = await SharedPreferences.getInstance();
  var status  = await checkStatus();
  print(status);
  if(!status){
    await saveLogout();
  }
  var name = prefs.getString('LastUser');
  var role  = prefs.getString('LastUserId');
  print(role);
  if(role==null || role ==""){
    runApp(MaterialApp(
      initialRoute: '/',
      routes: <String, WidgetBuilder>{
        '/': (context) => LoginPage(),
        '/HomeScreen': (context) => HomeScreen(role),
        '/login': (context) =>  LoginPage(),
      },
    ));
  }
  else{
    runApp(MaterialApp(
        initialRoute: '/',
        routes: <String, WidgetBuilder>{
        '/': (context) => HomeScreen(role),
        '/HomeScreen': (context) => HomeScreen(role),
        '/login': (context) =>  LoginPage(),
        },
    ));
  }

}
