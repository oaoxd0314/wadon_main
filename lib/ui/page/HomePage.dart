import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:wadone_main/bloc/pagebloc.dart';
import 'package:wadone_main/models/active.dart';
import 'package:wadone_main/ui/active/activeDetailPage.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() {
    return _HomePageState();
  }
}

class _HomePageState extends State<HomePage> {
  PageBloc pageBloc;

  void didChangeDependencies() async {
    super.didChangeDependencies();
    pageBloc = Provider.of<PageBloc>(context);
  }

  @override
  void dispose() {
    pageBloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: 
        // Consumer<PageBloc>(
        //     builder: (context, pageBloc, _) =>
                // RefreshIndicator(
                //   onRefresh: () async {
                //     await Future.delayed(Duration(seconds: 1));
                //     await active.increaseNumOfCards(context);
                //   },
                // child:
                Column(
                  children: <Widget>[
                    SizedBox(
                      height: 20,
                    ),
                    Text('asdsad'),
                    Text('asdsad'),
                    Text('asdsad'),
                    Text('asdsad'),
                    Flexible(
                      child: StreamBuilder(
                          stream: pageBloc.activeList(),
                          builder: (BuildContext context,
                              AsyncSnapshot<QuerySnapshot> snap) {
                            if (snap.hasData) {
                              List<DocumentSnapshot> docs = snap.data.documents;
                              List<Active> goalsList =
                                  pageBloc.mapToList(docList: docs);
                              if (goalsList.isNotEmpty) {
                                return buildList(goalsList);
                              } else {
                                return Text("data doesn't exist");
                              }
                            }
                            return Center(
                              child: CircularProgressIndicator(),
                            );
                          }),
                    ),
                  ],
                ));
  }
}

ListView buildList(List<Active> goalsList) {
  return ListView.separated(
      separatorBuilder: (BuildContext context, int index) => Divider(),
      itemCount: goalsList.length,
      itemBuilder: (context, index) {
        // final id = goalsList[index].description;
        final active = goalsList[index]; //catch this active
        return InkWell(
          child: ListTile(
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
            leading: Builder(
              builder: (BuildContext context) {
                return IconButton(
                  icon: const Icon(
                    Icons.add,
                  ),
                  onPressed: () {
                    ///add to personal list
                  },
                );
              },
            ),
          ),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ActiveDetailPage(
                  active: active,
                ),
              ),
            );
          },
        );
      });
}
