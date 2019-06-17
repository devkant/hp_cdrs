import 'package:shared_preferences/shared_preferences.dart';
import "package:flutter/material.dart";
import 'package:hp_cdrs/app_screens/loginPage.dart';
import 'package:hp_cdrs/app_screens/splashScreen.dart';
import 'package:hp_cdrs/app_screens/homeScreen.dart';
import 'package:hp_cdrs/connectionStatus.dart';



Future<void> main() async {
  ConnectionStatusSingleton connectionStatus = ConnectionStatusSingleton.getInstance();
  connectionStatus.initialize();

  SharedPreferences prefs = await SharedPreferences.getInstance();
  var name = prefs.getString('LastUser');
  var role  = prefs.getString('LastUserId');
  print(role);
  runApp(MaterialApp(home: role == null ? LoginPage() : HomeScreen(role)));
}