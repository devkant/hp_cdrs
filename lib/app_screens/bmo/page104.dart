import 'dart:core';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:hp_cdrs/common/functions/getToken.dart';
import 'package:hp_cdrs/app_screens/bmo/anmlist.dart';

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
    final token = await getToken();

    http.Response response = await http.get("http://13.235.43.83/api/104ByBlock",
      headers: {
        'authToken': token
      }
    );
    user = json.decode(response.body,);
    setState(() {
      appli = user["docs"];
    });
    String display;
    for(int i=0;i<appli.length;i++){
      if(appli[i]["anmAssigned"]==null){
        Appli104.add(appli[i]);
      }

    };
  }

  @override
  void initState() {
    super.initState();
    setState(() {
      getData();
    });

  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Appli104.isEmpty?
        Center(
          child: Text('No Application',
            style: TextStyle(fontSize: 20.0,
              color: Colors.black,
            ),
          ),
        ):ListView.builder(

          itemCount: Appli104 == null ? 0 : Appli104.length,
          itemBuilder: (BuildContext context, int index) {
              return ListTile(


                trailing: CircleAvatar(
                  backgroundImage: AssetImage("assets/hpgovt.png"),
                ),
                title: Text("${Appli104[index]["application"]}",
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.w700,
                  ),),
                subtitle: Text("Asha :  ${Appli104[index]['ashaName']}"),
                onTap: () {
                  setState(() {
                    Navigator.push(context, MaterialPageRoute(
                        builder: (context) => DetailPage(Appli104[index]))
                    );
                  });

                },
              );

          },
        )

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
      body: Padding(
        padding: EdgeInsets.only(top: 10.0,left: 10.0,bottom: 15.0),
        child: ListView(
          children: <Widget>[
            Text("Application Number : ${appli["application"].toString()}",
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.w400,
              ),
            ),
            Padding(padding: EdgeInsets.only(top: 8.0),),
            Text("Name : ${appli["name"]}",
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.w400,
              ),
            ),
            Padding(padding: EdgeInsets.only(top: 8.0),),
            Text("Address : ${appli["address"]}",
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.w400,
              ),
            ),
            Padding(padding: EdgeInsets.only(top: 8.0),),
            Text("Block : ${appli["block"]}",
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.w400,
              ),
            ),
            Padding(padding: EdgeInsets.only(top: 8.0),),
            Text("District : ${appli["district"]}",
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.w400,
              ),
            ),
            Padding(padding: EdgeInsets.only(top: 8.0),),
            Text("Asha : ${appli["ashaName"]}",
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),

      ),
      floatingActionButton : FloatingActionButton.extended(
        onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (context) => Anmlist(appliNumber: appli["application"].toString())));},
        icon : Icon(Icons.account_circle,),
        label: Text("Assign ANM"),
      ),

    );
  }
}


