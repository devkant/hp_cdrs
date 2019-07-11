
import 'dart:async';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:hp_cdrs/common/functions/getToken.dart';
import 'package:flutter/material.dart';


class completed extends StatefulWidget {
  @override
  _completedState createState() => _completedState();
}

class _completedState extends State<completed> {
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
  List completed=[];

  Future getData() async {
    final token = await getToken();
    http.Response response = await http.get("http://13.235.43.83/api/104ByBlock",
      headers: {
        'authToken' : token
      }
    );
    user = json.decode(response.body);
    setState(() {
      appli = user["docs"];
    });
    String display;
    for(int i=0;i<appli.length;i++){
      if(appli[i]["mo"]!=null){
        completed.add(appli[i]);
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
    print(completed);
    return Scaffold(
        body: completed.isEmpty?
            Center(
        child: Text('No Application',
          style: TextStyle(fontSize: 20.0,
            color: Colors.black,
          ),
        ),
      ):
      ListView.builder(
          itemCount: completed == null ? 0 : completed.length,
          itemBuilder: (BuildContext context, int index) {

              return ListTile(


                trailing: CircleAvatar(
                  backgroundImage: AssetImage("assets/hpgovt.png"),
                ),
                title: Text("${completed[index]["application"]}",
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.w700,
                  ),),
                subtitle: Text("Medical Officer :  ${completed[index]['mo']}"),
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(
                      builder: (context) => DetailPage(completed[index]))
                  );
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
            Padding(padding: EdgeInsets.only(top: 8.0),),
            Text("ANM Assigned : ${appli["anmAssigned"]}",
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.w400,
              ),
            ),
            Padding(padding: EdgeInsets.only(top: 8.0),),
            Text("ANM Officer: ${appli["anm"]}",
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.w400,
              ),
            ),
            Padding(padding: EdgeInsets.only(top: 8.0),),
            Text("MO Assigned : ${appli["moAssigned"]}",
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.w400,
              ),
            ),
            Padding(padding: EdgeInsets.only(top: 8.0),),
            Text("MO : ${appli["mo"]}",
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
      ),
    );
  }
}