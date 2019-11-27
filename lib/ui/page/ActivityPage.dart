import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../build/card.dart' as card;
import '../active/activeDetailPage.dart';

class ActivityPage extends StatefulWidget {
  @override
  _ActivityPageState createState() => _ActivityPageState();
}

class _ActivityPageState extends State<ActivityPage> {
  final String url = 'https://jsonplaceholder.typicode.com/posts';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
          stream: Firestore.instance.collection('post').snapshots(),
          builder: (context, snap) {
            if (snap.hasData) {
              List<DocumentSnapshot> dsList = snap.data.documents;
              return ListView.builder(
                  itemCount: dsList.length,
                  itemBuilder: (context, index) {
                    DocumentSnapshot doc = dsList[index];
                    return Container(
                        padding: EdgeInsets.only(left: 8, right: 8),
                        child: Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(Radius.zero),
                            ),
                            child: InkWell(
                              borderRadius: BorderRadius.all(Radius.zero),
                              child: ListTile(
                                title: Text(doc['title']),
                                subtitle: Text(doc['body']),
                                leading:
                                    Builder(builder: (BuildContext context) {
                                  return IconButton(
                                    icon: const Icon(
                                      Icons.delete,
                                    ),
                                    onPressed: () {
                                      Firestore.instance
                                          .collection('post')
                                          .document(doc.documentID)
                                          .delete();
                                    },
                                  );
                                }),
                              ),
                            )));
                  });
            }
            return Container(
              child: Text('loading wrong'),
            );
          }),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.data_usage),
          onPressed: () async {
            http.Response response = await http.get(url);
            List l = jsonDecode(response.body);
            l.forEach((e) =>
                Firestore.instance.collection('/post').document().setData(e));
          }),
    );
  }
}
