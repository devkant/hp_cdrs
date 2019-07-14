import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'package:hp_cdrs/common/functions/getToken.dart';
import 'dart:convert';


class PreviousForm extends StatefulWidget {
  @override
  PreviousFormState createState() => PreviousFormState();
}

class PreviousFormState extends State<PreviousForm> {


  Future<List<dynamic>> loadAppli() async{
    final token = await getToken();
    var response = await http.get('http://13.235.43.83/api/104PreviousForms',
        headers: {
          'authToken': token,
        }
    );
    if(response.statusCode==200){
      final jsonData  = json.decode(response.body);
      List<dynamic> listOfAppli = jsonData["docs"];
      return  listOfAppli;
    }
    else{
      throw Exception('Failed to load Internet');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Previous Filled Forms',
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 22.0,
          ),
        ),
      ),
      body: FutureBuilder<List<dynamic>>(
        future: loadAppli(),
        builder: (context, snapshot) {
          if (snapshot.hasData && snapshot.connectionState == ConnectionState.done){
            return  ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (context,index)  {
                  Map Appli = snapshot.data[index];
                  return  ListTile(
                    trailing: CircleAvatar(
                      backgroundImage: AssetImage("assets/hpgovt.png"),
                    ),
                    title: Text("${Appli["application"]}",
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.w700,
                      ),),
                    subtitle: Text("Name :  ${Appli['name']}"),
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(
                          builder: (context) => DetailPage(Appli))
                        );


                    },
                  );
                }

            );
          }
          else{
              return Center(child: CircularProgressIndicator());
          }

        },
      ),
    );
  }
}

class DetailPage extends StatelessWidget {

  DetailPage(this.appli);

  Map appli;


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

    );
  }
}
