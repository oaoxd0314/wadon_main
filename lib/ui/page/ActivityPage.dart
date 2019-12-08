import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

class ActivityPage extends StatefulWidget {
  @override
  _ActivityPageState createState() => _ActivityPageState();
}

class _ActivityPageState extends State<ActivityPage> {
  final String url = 'https://jsonplaceholder.typicode.com/posts';

  @override
  Widget build(BuildContext context) {
     return Scaffold(
        resizeToAvoidBottomPadding: false,
        body: SingleChildScrollView(
          child: AnimationLimiter(
            child: Column(
              children: AnimationConfiguration.toStaggeredList(
                  duration: const Duration(milliseconds: 375),
                  childAnimationBuilder: (widget) => SlideAnimation(
                        horizontalOffset: 50.0,
                        child: FadeInAnimation(
                          child: widget,
                        ),
                      ),
                  children: [///畫面
                    view()
                  ]),
            ),
          ),
        ),



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

  Widget view() {
    return Container(
      height: MediaQuery.of(context).size.height,///自動符合頁面高度
        child: Column(
          children: <Widget>[
            Flexible(
                child: StreamBuilder(
                    stream: Firestore.instance.collection('post').snapshots(),
                    builder: (BuildContext context, snap) {
                      if (snap.hasData) {
                        List<DocumentSnapshot> dsList = snap.data.documents;
                        return ListView.separated(
                          separatorBuilder: (BuildContext context, int index) => Divider(),
                            itemCount: dsList.length,
                            itemBuilder: (context, index) {
                              DocumentSnapshot doc = dsList[index];
                              return Container(
                                  child: Card(
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.all(Radius.zero),
                                      ),
                                      child: InkWell(
                                        borderRadius:
                                            BorderRadius.all(Radius.zero),
                                        child: ListTile(
                                          title: Text(doc['title']),
                                          subtitle: Text(doc['body']),
                                          leading: Builder(
                                              builder: (BuildContext context) {
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
                    }))
          ],
        ));
  }
}
