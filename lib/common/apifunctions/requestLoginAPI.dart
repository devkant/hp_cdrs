import 'dart:async';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:hp_cdrs/common/functions/saveCurrentLogin.dart';
import 'package:hp_cdrs/common/functions/showDialogSingleButton.dart';
import 'dart:convert';
import 'package:hp_cdrs/app_screens/homeScreen.dart';

import 'package:hp_cdrs/model/json/loginModel.dart';

Future<LoginModel> requestLoginAPI(BuildContext context, String username, String password) async {
  final url = "http://13.235.43.83/api/login";

  Map<String, String> body = {
    'username': username,
    'password': password,
  };

  final response = await http.post(
    url,
    body: body,
  );

  if (response.statusCode == 200) {
    final responseJson = json.decode(response.body);
    User user = new User(LoginModel.fromJson(responseJson).name, LoginModel.fromJson(responseJson).role);
    print("success");

    saveCurrentLogin(responseJson);
    Navigator.of(context).pop();                        //for waiting dialog
    Navigator.pushReplacement(
        context,
        new MaterialPageRoute(
            builder: (BuildContext context) =>
            HomeScreen(user.role),
          settings: RouteSettings(name: "HomeScreen")
        ));

    return LoginModel.fromJson(responseJson);
  } else {
    showDialogSingleButton(context, "Unable to Login", "You may have supplied an invalid 'Username' / 'Password' combination. Please try again or contact your support representative.", "OK");
    return null;
  }
}

class User{
  String name;
  String  role;

  User(this.name,this.role);
}



