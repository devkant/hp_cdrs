import 'package:flutter/material.dart';
import 'package:hp_cdrs/app_screens/bmo/page104.dart';

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

  @override
  void initState() {
    _IsSearching = false;
  }
  Widget appBarTitle =  Text(
    'Block Medical Officer( H.P. )',
    style: TextStyle(
      fontWeight: FontWeight.w400,
      fontSize: 22.0,
    ),
  );
  Icon actionIcon = Icon(Icons.search, color: Colors.white,);
  final key = GlobalKey<ScaffoldState>();
  final TextEditingController _searchQuery = TextEditingController();
  bool _IsSearching;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(length: 3,
        child: Scaffold(
            key: key,
            appBar: buildBar(context),
            body: TabBarView(
              children: <Widget>[
                page104(),
                page104(),
                page104()
              ],
            )
        ),
      ),
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
                    Text('104'),
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
                    Text('Pending'),
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
        actions: <Widget>[
          IconButton(
            icon: actionIcon,
            onPressed: () {
              setState(() {
                if (this.actionIcon.icon == Icons.search) {
                  this.actionIcon = Icon(Icons.close, color: Colors.white,);
                  this.appBarTitle = TextField(
                    controller: _searchQuery,
                    style: TextStyle(
                      color: Colors.white,

                    ),
                    decoration: InputDecoration(
                        prefixIcon: Icon(Icons.search, color: Colors.white),
                        hintText: "Search...",
                        hintStyle: TextStyle(color: Colors.white)
                    ),
                  );
                  _handleSearchStart();
                }
                else {
                  _handleSearchEnd();
                }
              });
            },),
        ]
    );
  }

  void _handleSearchStart() {
    setState(() {
      _IsSearching = true;
    });
  }

  void _handleSearchEnd() {
    setState(() {
      this.actionIcon = Icon(Icons.search, color: Colors.white,);
      this.appBarTitle = Text(
        'Block Medical Officer( H.P. )',
        style: TextStyle(
          fontWeight: FontWeight.w400,
          fontSize: 22.0,
        ),
      );
      _IsSearching = false;
      _searchQuery.clear();
    });
  }
}


