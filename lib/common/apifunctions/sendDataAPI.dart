import 'package:connectivity/connectivity.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

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

Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

Future<String> _getMobileToken() async {
  final SharedPreferences prefs = await _prefs;

  return prefs.getString(_storageKeyMobileToken) ?? '';
}

Future<String> createPost(String url, Map data) async {

  final response  = await http.post(
    url,
    body: data,
    headers: {
      'TOKEN':  '132123213'//await _getMobileToken()
    },
  );

  if  (response.statusCode==200){
    print("done");
  }else{
    print("error");
  }

  return  "success";

}