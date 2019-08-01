import 'package:connectivity/connectivity.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'package:hp_cdrs/common/functions/getToken.dart';
import 'dart:convert';
import 'package:hp_cdrs/common/functions/checkInternet.dart';
import 'dart:io';

const String  _storageKeyMobileToken = "token";

Future<bool>  sendData(String url,var data) async{
  var internet  = await checkInternet();
  var connectivityResult = await (Connectivity().checkConnectivity());
  if (connectivityResult == ConnectivityResult.mobile ||  connectivityResult == ConnectivityResult.wifi && internet==true ) {
    print("internet available");
      bool status = await apiRequest(url, data);
      if(status==true){
        return true;
      }
      else  {
        return false;
      }
  } else {
    print("Unable to connect. Please Check Internet Connection");
    return false;
  }
}


Future<Post> createPost(String url, var data) async {
  print(data);
  final token = await getToken();
  data  = json.encode(data);
  final response  = await http.post(
    url,
    body: data,
    headers: {
      "accept-encoding" : "appplication/json",
      "Content-Type": "'application/json'",
      'authToken':  token,
    },
  );
  print(response.statusCode);
  if  (response.statusCode==200){
    print("");
  }else{
    print(response.statusCode);
  }

  return  Post.fromJson(json.decode(response.body));

}


class Post {
  final String success;


  Post({this.success});

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      success: json['success'],

    );
  }

  Map toMap() {
    var map = new Map<String, dynamic>();
    map["success"] = success;


    return map;
  }
}


Future<bool> apiRequest(String url, var jsonMap) async {
  final token = await getToken();
  HttpClient httpClient = new HttpClient();
  HttpClientRequest request = await httpClient.postUrl(Uri.parse(url));
  request.headers.set('content-type', 'application/json');
  request.headers.set('authToken',token);
  request.add(utf8.encode(json.encode(jsonMap)));
  HttpClientResponse response = await request.close();
  // todo - you should check the response.statusCode
  print(response.statusCode);
  if(response.statusCode==200){
    return true;
  }
  else  {
    return  false;
  }

}