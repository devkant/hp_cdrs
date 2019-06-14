import 'dart:core';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:flutter/material.dart';


class page104 extends StatefulWidget {
  @override
  _page104State createState() => _page104State();
}

class _page104State extends State<page104> {
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
  List appli=[];
  List Appli104=[];

  Future getData() async {
    http.Response response = await http.get("http://13.126.72.137/api/104PreviousForms");
    user = json.decode(response.body);
    debugPrint(user.toString());
    setState(() {
      appli = user["docs"];
    });
    print(appli.length);
    for(int i=0;i<appli.length;i++){
      print(appli[i]["anmAssigned"]);
      if(appli[i]["anmAssigned"]==null){
        Appli104.add(appli[i]);
      }
    };
    print(Appli104);
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
        itemCount: Appli104 == null ? 0 : Appli104.length,
        itemBuilder: (BuildContext context, index) {
          if(true) {
            return ListTile(
              trailing: CircleAvatar(
                backgroundImage: AssetImage("assets/hpgovt.png"),
              ),
              title: Text("${Appli104[index]["application"]}",
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.w700,
                ),),
              subtitle: Text("${Appli104[index]["name"]}"),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(
                    builder: (context) => DetailPage(Appli104[index]))
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



