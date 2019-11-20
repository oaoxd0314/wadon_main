import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:wadone_main/bloc/pagebloc.dart';
import 'package:wadone_main/models/active.dart';



class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() { return _HomePageState();
  } 
}

class _HomePageState extends State<HomePage> {
  // final String url = 'https://jsonplaceholder.typicode.com/posts';
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<PageBloc>(
        builder: (context,pageBloc,_) =>
        StreamBuilder(
          stream: pageBloc.activeList(),
          builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snap,) {
            if (snap.hasData) {
            List<DocumentSnapshot> docs = snap.data.documents;
            List<Active> goalsList = pageBloc.mapToList(docList: docs);
            if (goalsList.isNotEmpty) {
              return buildList(goalsList);
            } else {
              return Text("lost data?????");
            }
          }
            return Container(
              child: Text('loading wrong'),
            );
          }),
      ),
    );
  }
}


ListView buildList(List<Active> goalsList) {
    return ListView.separated(
        separatorBuilder: (BuildContext context, int index) => Divider(),
        itemCount: goalsList.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(
              goalsList[index].title,
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            subtitle: Text(goalsList[index].description),
            trailing: Text(
              goalsList[index].club,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 10.0,
              ),
            ),
          );
        });
  }



