import 'dart:async';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'package:hp_cdrs/common/functions/getToken.dart';
import 'package:hp_cdrs/common/functions/saveLogout.dart';
import 'package:hp_cdrs/model/json/loginModel.dart';

Future<LoginModel> requestLogoutAPI(BuildContext context) async {
  final url = "http://13.126.72.137/api/logout";

  var token = await getToken();


  final response = await http.post(
    url,
    headers: {
    'authToken':  token
    },
  );

  if (response.statusCode == 200) {
    saveLogout();
    return null;
  } else {
    saveLogout();
    return null;
  }
}