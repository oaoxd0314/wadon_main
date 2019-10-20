import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() => runApp(MaterialApp(
      home: HomePage(),
    ));

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final String host ='http://35.201.158.20/wadone/data.php';
  @override
  void initState(){
    super.initState();
  }
  getData(){
    return http.get(host);
    }

    @override
    Widget build(BuildContext context) {
      getData();
    return Scaffold(
      body: FutureBuilder(
        future: getData(),
        builder:(context,snap){
          if(!snap.hasData){
            return Container();
          }

          List datas = jsonDecode(snap.data.body);
         return ListView.builder(
            itemCount: datas.length,
            itemBuilder: (context, idx){
              var data = datas[idx];
              return ListTile(title: Text(data['id']),subtitle: Text(data['username']),);
            });
        },
      )
    );
  }
  }
  