import 'package:shared_preferences/shared_preferences.dart';
import 'package:hp_cdrs/model/json/loginModel.dart';

saveCurrentLogin(Map responseJson) async {
  SharedPreferences preferences = await SharedPreferences.getInstance();


  var user;
  if ((responseJson != null && !responseJson.isEmpty)) {
    user = LoginModel.fromJson(responseJson).name;
  } else {
    user = "";
  }
  var token = (responseJson != null && !responseJson.isEmpty) ? LoginModel.fromJson(responseJson).authToken : "";
  var role = (responseJson != null && !responseJson.isEmpty) ? LoginModel.fromJson(responseJson).role : "";

  await preferences.setString('LastUser', (user != null && user.length > 0) ? user : "");
  await preferences.setString('LastToken', (token != null && token.length > 0) ? token : "");
  await preferences.setString('LastUserId', (role != null && role.length > 0) ? role : "");

}