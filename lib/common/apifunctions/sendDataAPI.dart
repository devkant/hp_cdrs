import 'package:connectivity/connectivity.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'package:hp_cdrs/common/functions/getToken.dart';
import 'dart:convert';

const String  _storageKeyMobileToken = "token";

Future<bool>  sendData(String url,Map data) async{
  var connectivityResult = await (Connectivity().checkConnectivity());
  if (connectivityResult == ConnectivityResult.mobile ||  connectivityResult == ConnectivityResult.wifi) {
    print("Connected to Mobile Network");
    createPost(url, data);
    return true;
  } else {
    print("Unable to connect. Please Check Internet Connection");
    return false;
  }
}


Future<Post> createPost(String url, Map data) async {
  final token = await getToken();
  final response  = await http.post(
    url,
    body: data,
    headers: {
      'auTOKEN':  token
    },
  );

  if  (response.statusCode==200){
    print("success");
  }else{
    print("sending of failed");
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