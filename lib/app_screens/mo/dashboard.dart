import 'package:flutter/material.dart';
import 'package:hp_cdrs/common/widgets/basicDrawer.dart';
import 'package:hp_cdrs/app_screens/verbal_autopsy/verbal_autopsy_form.dart';
import 'package:hp_cdrs/app_screens/verbal_autopsy/user.dart';

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
  final User  = user();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: BasicDrawer(),
      appBar: AppBar(
        title: Text("MO DashBoard"),
        elevation: .1,
        backgroundColor: Colors.blue,
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
                              builder: (BuildContext  context)  =>  verbalAutopsyForm(verbal_Autopsy_Obj:User))
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
                ))

          ],
        ),
      ),
    );
  }

}