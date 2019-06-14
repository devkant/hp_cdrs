
import 'dart:async';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:flutter/material.dart';


class pending extends StatefulWidget {
  @override
  _pendingState createState() => _pendingState();
}

class _pendingState extends State<pending> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Listview(),
    );
  }
}

class Listview extends StatefulWidget {
  @override
  _ListviewState createState() => _ListviewState();
}

class _ListviewState extends State<Listview> {

  Map user;
  List appli;
  List pending;

  Future getData() async {
    http.Response response = await http.get("http://13.126.72.137/api/104PreviousForms");
    user = json.decode(response.body);

    setState(() {
      appli = user["docs"];
      debugPrint(appli.toString());
    });

    for(int i=0;i<appli.length;i++){
      print(appli[i]["mo"]);
      if(appli[i]["mo"]==null){
        pending.add(appli[i]);
      }
    };

  }

  @override
  void initState() {
    super.initState();
    getData();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: pending == null ? 0 : pending.length,
        itemBuilder: (BuildContext context, index) {
          if(true) {
            return ListTile(
              title: Text("${pending[index]["application"]}",
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.w700,
                ),),
              subtitle: Text("${pending[index]["ashaName"]}"),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(
                    builder: (context) => DetailPage(pending[index]))
                );
              },
            );
          }
        },
      ),
    );
  }
}

class DetailPage extends StatelessWidget {

  DetailPage(this.appli);

  final appli;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("104"),
      ),
      body: ListView(
        children: <Widget>[
          Text(appli["application"].toString(),
            style: TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.w300,
            ),
          ),
          Text(appli["name"],
            style: TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.w300,
            ),
          ),
          Text(appli["ashaName"],
            style: TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.w300,
            ),
          ),
          Text(appli["district"],
            style: TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.w300,
            ),
          ),
          Text(appli["block"],
            style: TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.w300,
            ),
          ),

        ],
      ),
    );
  }
}



