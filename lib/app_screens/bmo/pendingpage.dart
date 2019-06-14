
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
  List appli;

  Future getData() async {
    http.Response response = await http.get("http://13.126.72.137/api/104PreviousForms");
    user = json.decode(response.body);

    setState(() {
      appli = user["docs"];
      debugPrint(appli.toString());
    });
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
        itemCount: appli == null ? 0 : appli.length,
        itemBuilder: (BuildContext context, index) {
          if(!user.containsKey("anmAssigned")) {
            return ListTile(
              title: Text("${appli[index]["application"]}",
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.w700,
                ),),
              subtitle: Text("${appli[index]["ashaName"]}"),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(
                    builder: (context) => DetailPage(appli[index]))
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



