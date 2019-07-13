import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'package:hp_cdrs/common/functions/getToken.dart';
import 'dart:io';

Future<bool>  checkStatus() async {
  final token = await getToken();

  try {
    final result = await InternetAddress.lookup('google.com');
    if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
      var response  = await http.get('http://13.235.43.83/api/isLoggedIn',
          headers: {
            'authToken':  token,
          }
      );
      print(response.statusCode);

      if(response.statusCode  ==  200)  {
        return  true;
      }
      else if(response.statusCode ==  401) {
        return  false;
      }
      else{
        return  true;
      }
    }
  } on SocketException catch (_) {
      return  true;
    }

}


