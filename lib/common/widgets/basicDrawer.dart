import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hp_cdrs/common/apifunctions/requestLogoutAPI.dart';
import 'package:hp_cdrs/app_screens/loginPage.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:hp_cdrs/app_screens/about.dart';


class BasicDrawer extends StatefulWidget {
  @override
  _BasicDrawerState createState() => _BasicDrawerState();
}

class _BasicDrawerState extends State<BasicDrawer>  {

  @override
  void initState() {
    super.initState();
    
  }

  Future<String>  getInfo() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();

    final name  = preferences.getString('LastUser');

    return  name;
  }


  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(children: <Widget>[
        FutureBuilder<String>(
          future: getInfo(),
          builder: (BuildContext context,AsyncSnapshot snapshot){
            switch(snapshot.connectionState){
              case ConnectionState.none:
              case ConnectionState.waiting:
                return  Text('Loading...');
              default:
                if (snapshot.hasError)
                  return new Text('Error: ${snapshot.error}');
                else
                  return UserAccountsDrawerHeader(
                    accountName: Text('Hello ${snapshot.data} !',
                      style: TextStyle(
                          fontSize: 20.0
                      ),
                    ),
                    currentAccountPicture: CircleAvatar(
                      backgroundImage: AssetImage("assets/hpgovt.png"),
                    ),
                  );
            }
          },
        ),

        ListTile(title: Text("About", style: TextStyle(
            color: Colors.black, fontSize: 20.0),),
          onTap: () {
            SystemChannels.textInput.invokeMethod('TextInput.hide');
            Navigator.of(context).push(
                MaterialPageRoute(
                    builder: (BuildContext  context)  =>  About())
            );
//              Here I have not implemented an actual about screen, but if you did you would navigate to it's route
//              Navigator.of(context).pushReplacementNamed('/AboutScreen');
          },
        ),
        ListTile(title: Text("Logout", style: TextStyle(
            color: Colors.black, fontSize: 20.0),),
          onTap: () async{
            requestLogoutAPI(context);
//            Navigator.pushReplacement(context,
//                MaterialPageRoute(builder: (BuildContext ctx) => LoginPage()));
            Navigator.of(context)
                .pushNamedAndRemoveUntil('/login', (Route<dynamic> route) => false);
          },
        ),
      ],
      ),
    );
  }
}

