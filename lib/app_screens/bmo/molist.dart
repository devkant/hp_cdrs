import 'package:flutter/material.dart';

import 'dart:async';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Molist extends StatefulWidget {
  @override
  _MolistState createState() => _MolistState();
}

class _MolistState extends State<Molist> {
  final String uri = 'http://13.126.72.137/api/anm';//provide the url for mo list now it is given
                                            // for anm.

  Future<List<Users>> _fetchUsers() async {
    var response = await http.get(uri);

    if (response.statusCode == 200) {
      final items = json.decode(response.body).cast<Map<String, dynamic>>();
      List<Users> listOfUsers = items.map<Users>((json) {
        return Users.fromJson(json);
      }).toList();

      return listOfUsers;
    } else {
      throw Exception('Failed to load internet');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('ANM List',
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 22.0,
          ),
        ),
      ),
      body: FutureBuilder<List<Users>>(
        future: _fetchUsers(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) return Center(child: CircularProgressIndicator());

          return ListView(
            children: snapshot.data
                .map((user) => ListTile(
              title: Text(user.name),
              subtitle: Text(user.email),
              leading: CircleAvatar(
                backgroundColor: Colors.red,
                child: Text(user.name[0],
                    style: TextStyle(
                      fontSize: 18.0,
                      color: Colors.white,
                    )),
              ),
            ))
                .toList(),
          );
        },
      ),
    );
  }
}

class Users {
  int nextAppl;
  String nextName;
  String nextAddress;
  String id;
  String name;
  String username;
  String role;
  int age;
  String gender;
  String district;
  String block;
  String email;
  int mobile;
  int v;

  Users({
    this.nextAppl,
    this.nextName,
    this.nextAddress,
    this.id,
    this.name,
    this.username,
    this.role,
    this.age,
    this.gender,
    this.district,
    this.block,
    this.email,
    this.mobile,
    this.v,
  });

  factory Users.fromJson(Map<String, dynamic> json) {
    return Users(
      nextAppl: json["next_appl"] == null ? null : json["next_appl"],
      nextName: json["next_name"] == null ? null : json["next_name"],
      nextAddress: json["next_address"] == null ? null : json["next_address"],
      id: json["_id"] == null ? null : json["_id"],
      name: json["name"] == null ? null : json["name"],
      username: json["username"] == null ? null : json["username"],
      role: json["role"] == null ? null : json["role"],
      age: json["age"] == null ? null : json["age"],
      gender: json["gender"] == null ? null : json["gender"],
      district: json["district"] == null ? null : json["district"],
      block: json["block"] == null ? null : json["block"],
      email: json["email"] == null ? null : json["email"],
      mobile: json["mobile"] == null ? null : json["mobile"],
      v: json["__v"] == null ? null : json["__v"],
    );
  }
}
