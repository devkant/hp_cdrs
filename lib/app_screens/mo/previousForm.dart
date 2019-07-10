import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'package:hp_cdrs/common/functions/getToken.dart';
import 'dart:convert';

void main()=>runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primaryColor: Colors.blue),
      home: PreviousForm(),
    );
  }
}

class Appli{
  String  appliNumber;
  String  name;
  String  address;
  String  neoFilled;
  String  postNeoFilled;
  String  socialFilled;

  Appli({this.appliNumber,this.name,this.address,this.neoFilled,this.postNeoFilled,this.socialFilled});

  factory Appli.fromJson(Map<String,dynamic> parsedJson){
    return  Appli(
      appliNumber:  parsedJson['appliNumber'],
      name: parsedJson['name'],
      address:  parsedJson['address'],
      neoFilled:  parsedJson['neoFilled'],
      postNeoFilled:  parsedJson['postNeoFilled'],
      socialFilled: parsedJson['socialFilled']

    );
  }
}

Future<List<Appli>> loadAppli() async{
  final token = await getToken();
  var response = await http.get('http://13.235.43.83/api/test',
      headers: {
        'authToken': token,
      }
  );
  if(response.statusCode==200){
    final items = json.decode(response.body).cast<Map<String,dynamic>>();
    List  <Appli> listOfAppli = items.map<Appli>((json) {
      return Appli.fromJson(json);
    }).toList();
    return  listOfAppli;
  }
  else{
    throw Exception('Failed to load Internet');
  }
}

class PreviousForm extends StatefulWidget {
  @override
  PreviousFormState createState() => PreviousFormState();
}

class PreviousFormState extends State<PreviousForm> {

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
      body: FutureBuilder<List<Appli>>(
        future: loadAppli(),
        builder: (context, snapshot) {
          if (!snapshot.hasData)
            return Center(child: CircularProgressIndicator());

          return ListView(
            children: snapshot.data
                .map((user) =>
                ListTile(
                  title: Text(user.name),
                  subtitle: Text(user.address),
                  leading: CircleAvatar(
                    backgroundColor: Colors.red,
                    child: Text(user.name[0],
                        style: TextStyle(
                          fontSize: 18.0,
                          color: Colors.white,
                        )),
                  ),
                  onTap: () {},
                )).toList(),
          );
        },
      ),
    );
  }
}