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
  var next_appl = (responseJson!=null && !responseJson.isEmpty)  ? LoginModel.fromJson(responseJson).next_appl:  "";
  var name = (responseJson!=null && !responseJson.isEmpty)  ? LoginModel.fromJson(responseJson).name:  "";

  await preferences.setString('LastUser', (user != null && user.length > 0) ? user : "");
  await preferences.setString('LastToken', (token != null && token.length > 0) ? token : "");
  await preferences.setString('LastUserId', (role != null && role.length > 0) ? role : "");
  await preferences.setString('newApplication', (next_appl !=  null && next_appl.toString().length > 0)  ? next_appl.toString() : "");
  await preferences.setString('name', (name !=  null && name.length > 0)  ? name : "");
}