import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hp_cdrs/common/widgets/basicDrawer.dart';
import 'package:hp_cdrs/app_screens/bmo/page104.dart';
import 'package:hp_cdrs/app_screens/bmo/completedpage.dart';
import 'package:hp_cdrs/app_screens/bmo/pendingpage.dart';
import 'package:hp_cdrs/common/apifunctions/requestLogoutAPI.dart';
import 'package:hp_cdrs/app_screens/loginPage.dart';
import 'package:hp_cdrs/app_screens/bmo/anmlist.dart';
import 'package:hp_cdrs/app_screens/bmo/molist.dart';

void main()=>runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primaryColor: Colors.blue),
      home: BMOhomepage(),
    );
  }
}


class BMOhomepage extends StatefulWidget {
  BMOhomepage({ Key key }) : super(key: key);
  @override
  _BMOhomepageState createState() => _BMOhomepageState();
}

class _BMOhomepageState extends State<BMOhomepage> with SingleTickerProviderStateMixin{

  Widget appBarTitle =  Text(
    'Block Medical Officer',
    style: TextStyle(
      fontWeight: FontWeight.w400,
      fontSize: 22.0,
    ),
  );
  final key = GlobalKey<ScaffoldState>();

  Future<bool> onWillPop() {
    if(key.currentState.isDrawerOpen == false) {
      key.currentState.openDrawer();
      return Future.value(false);
    }
    else if(key.currentState.isDrawerOpen == true){
      return Future.value(true);
    }
  }


  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: onWillPop,
//      child: MaterialApp(
        child: DefaultTabController(length: 3,
          child: Scaffold(
              key: key,
              appBar: buildBar(context),
              body: TabBarView(
                children: <Widget>[
                  page104(),
                  pending(),
                  completed(),
                ],
              ),
              drawer: BasicDrawer(),
//          drawer: Drawer(
//            child: ListView(children: <Widget>[
//              UserAccountsDrawerHeader(
//                //accountName: ,
//                currentAccountPicture: CircleAvatar(
//                  backgroundImage: AssetImage("assets/hpgovt.png"),
//                ),
//              ),
//              ListTile(title: Text("MO", style: TextStyle(
//                  color: Colors.black, fontSize: 20.0),),
//                onTap: () {
//                  Navigator.pushReplacement(context,
//                      MaterialPageRoute(builder: (BuildContext ctx) => Molist()));
//                },
//              ),
//              ListTile(title: Text("ANMs", style: TextStyle(
//                  color: Colors.black, fontSize: 20.0),),
//                onTap: () {
//                  Navigator.pushReplacement(context,
//                      MaterialPageRoute(builder: (BuildContext ctx) => Anmlist()));
//                },
//              ),
//              ListTile(title: Text("About", style: TextStyle(
//                  color: Colors.black, fontSize: 20.0),),
//                onTap: () {
//                  SystemChannels.textInput.invokeMethod('TextInput.hide');
////              Here I have not implemented an actual about screen, but if you did you would navigate to it's route
////              Navigator.of(context).pushReplacementNamed('/AboutScreen');
//                },
//              ),
//              ListTile(title: Text("Logout", style: TextStyle(
//                  color: Colors.black, fontSize: 20.0),),
//                onTap: () {
//                  requestLogoutAPI(context);
//                  Navigator.pushReplacement(context,
//                      MaterialPageRoute(builder: (BuildContext ctx) => LoginPage()));
//                },
//              ),
//            ],
//            ),
//          ),

          ),
        ),
//      ),
    );
  }

  Widget buildBar(BuildContext context) {
    return AppBar(
        centerTitle: true,
        title: appBarTitle,
        bottom: TabBar(
          labelPadding: EdgeInsets.only(left: 2.0,right: 5.0),
          indicatorColor: Colors.white,
          indicatorSize: TabBarIndicatorSize.tab,
          unselectedLabelColor: Colors.white,
          labelColor: Colors.amber,
          tabs: <Widget>[
            Tab(
                child:
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Text('Assign ANM'),
                    //Padding(padding: EdgeInsets.only(left: 5.0,bottom: 5.0)),
                    Icon(Icons.assignment),
                  ],
                )
            ),
            Tab(
                child:
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Text('Assign MO'),
                    //Padding(padding: EdgeInsets.only(left: 8.0,bottom: 5.0,right: 5.0)),
                    Icon(Icons.announcement),
                  ],
                )
            ),
            Tab(
                child:
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Text('Completed'),
                    //Padding(padding: EdgeInsets.only(left: 8.0,bottom: 5.0)),
                    Icon(Icons.assignment_turned_in),
                  ],
                )
            ),
          ],
        ),
    );
  }



}


