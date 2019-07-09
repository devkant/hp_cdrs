import 'package:flutter/material.dart';
import 'package:hp_cdrs/common/widgets/basicDrawer.dart';
import 'package:hp_cdrs/app_screens/verbal_autopsy/verbal_autopsy_form.dart';
import 'neoFormStatus.dart';
import 'socialAutopsyFormStatus.dart';
import 'postNeoFormStatus.dart';
import 'package:flutter/services.dart';
import 'previousForm.dart';


void  main(){
  runApp(MaterialApp(
    initialRoute: '/',
    routes: <String, WidgetBuilder>{
      '/': (context) => Dashboard(),
      '/Neonate': (context) => verbalAutopsyForm(),

    },
  ));
}

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  Future<bool> onWillPop() {
    if(_scaffoldKey.currentState.isDrawerOpen == false) {
      _scaffoldKey.currentState.openDrawer();
      return Future.value(false);
    }
    else if(_scaffoldKey.currentState.isDrawerOpen == true){
      return Future.value(true);
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: onWillPop,
      child: Scaffold(
        key: _scaffoldKey,
        drawer: BasicDrawer(),
        appBar: AppBar(
          title: Text("MO DashBoard"),
          elevation: .1,
          backgroundColor: Colors.blue,
        ),
        floatingActionButton: FloatingActionButton.extended(
            onPressed: (){
              Navigator.push(context,
                  MaterialPageRoute(builder:(BuildContext  context)  =>  PreviousForm())
              );
            },
            icon: Icon(Icons.storage),
            label: Text('Previous Filled Forms'),
        ),
        body: Container(
          padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 2.0),
          child: GridView.count(
            crossAxisCount: 2,
            padding: EdgeInsets.all(3.0),
            children: <Widget>[
              Card(
                  elevation: 1.0,
                  margin: new EdgeInsets.all(8.0),
                  child: Container(
                    decoration: BoxDecoration(color: Color.fromRGBO(220, 220, 220, 1.0)),
                    child: new InkWell(
                      onTap: () {
                        Navigator.of(context).push(
                            MaterialPageRoute(
                                builder: (BuildContext  context)  =>  neoFormsStatus())
                        );

                      },
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        mainAxisSize: MainAxisSize.min,
                        verticalDirection: VerticalDirection.down,
                        children: <Widget>[
                          SizedBox(height: 50.0),
                          Center(
                              child: Icon(
                                Icons.child_friendly,
                                size: 40.0,
                                color: Colors.black,
                              )),
                          SizedBox(height: 20.0),
                          new Center(
                            child: new Text('Verbal Autopsy\n (Neonate)',
                                style:
                                new TextStyle(fontSize: 15.0, color: Colors.black)),
                          )
                        ],
                      ),
                    ),
                  ),
              ),
              Card(
                  elevation: 1.0,
                  margin: new EdgeInsets.all(8.0),
                  child: Container(
                    decoration: BoxDecoration(color: Color.fromRGBO(220, 220, 220, 1.0)),
                    child: new InkWell(
                      onTap: () {
                        Navigator.of(context).push(
                            MaterialPageRoute(
                                builder: (BuildContext  context)  =>  SocialAutopsyFormStatus())
                        );

                      },
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        mainAxisSize: MainAxisSize.min,
                        verticalDirection: VerticalDirection.down,
                        children: <Widget>[
                          SizedBox(height: 50.0),
                          Center(
                              child: Icon(
                                Icons.people,
                                size: 40.0,
                                color: Colors.black,
                              )),
                          SizedBox(height: 20.0),
                          new Center(
                            child: new Text('Social Autopsy',
                                style:
                                new TextStyle(fontSize: 15.0, color: Colors.black)),
                          )
                        ],
                      ),
                    ),
                  )

              )
              ,
              Card(
                  elevation: 1.0,
                  margin: new EdgeInsets.all(8.0),
                  child: Container(
                    decoration: BoxDecoration(color: Color.fromRGBO(220, 220, 220, 1.0)),
                    child: new InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                            MaterialPageRoute(
                                builder: (BuildContext  context)  =>  PostNeoFormsStatus())
                        );

                      },
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        mainAxisSize: MainAxisSize.min,
                        verticalDirection: VerticalDirection.down,
                        children: <Widget>[
                          SizedBox(height: 50.0),
                          Center(
                              child: Icon(
                                Icons.child_care,
                                size: 40.0,
                                color: Colors.black,
                              )),
                          SizedBox(height: 20.0),
                          new Center(
                            child: new Text('Verbal Autopsy\n  (Post Neonate)',
                                style:
                                new TextStyle(fontSize: 15.0, color: Colors.black)),
                          )
                        ],
                      ),
                    ),
                  )


              )


            ],
          ),
        ),
      ),
    );
  }

}