import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:io';
import 'package:http/http.dart' as  http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:hp_cdrs/common/platform/platformScaffold.dart';
import 'package:hp_cdrs/common/widgets/basicDrawer.dart';
import 'package:hp_cdrs/app_screens/asha_worker/asha_home.dart';
import 'package:hp_cdrs/app_screens/bmo/bmohomepage.dart';


class HomeScreen extends StatefulWidget {
  final String role;
  HomeScreen(this.role,{Key key}):super(key:key);
  @override
  _HomeScreenState createState() =>  _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  void initState() {
    super.initState();
    _saveCurrentRoute("/HomeScreen");
  }

  _saveCurrentRoute(String lastRoute) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.setString('LastScreenRoute', lastRoute);
  }

  @override
  Widget build(BuildContext context) {
    if(widget.role=="104"){
      return AshaHomeScreen();
    }
    else if(widget.role=="bmo"){
      return  BMOhomepage();
    }
  }
}

class User{
  String name;
  String  role;

  User(this.name,this.role);
}
