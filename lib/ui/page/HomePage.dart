import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:wadone_main/bloc/pagebloc.dart';
import 'package:wadone_main/models/active.dart';
import 'package:wadone_main/ui/page/Profile.dart';
import 'package:wadone_main/ui/page/ActivityPage.dart';
import 'package:wadone_main/ui/page/SubscriptionPage.dart';
import 'package:wadone_main/ui/page/NotificationPage.dart';
import 'package:wadone_main/ui/build/drawer.dart';


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




class MainPage extends StatefulWidget {
  // MainPage({Key key, this.title}) : super(key: key);
  // final String title;

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedIndex = 0;
  final List<Widget> _children = [
    HomePage(),
    SubscriptionPage(),
    ActivityPage(),
    NotificationPage(),
    Profile(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      drawer: BuildDrawer(),
      body: _children[_selectedIndex],
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(
          canvasColor: Colors.teal[200],
        ),
        child: buildNavigationBar(),
      ),
    );
  }

  Widget buildAppBar() {
    return AppBar(
      leading: Builder(builder: (BuildContext context) {
        return IconButton(
          icon: const Icon(
            Icons.menu,
            size: 30.0,
          ),
          onPressed: () {
            Scaffold.of(context).openDrawer(); //點擊menu打開Drawer
          },
        );
      }),
      title: Text("wadon app"),
    );
  }

  Widget buildNavigationBar() {
    return BottomNavigationBar(
      items: <BottomNavigationBarItem>[
        new BottomNavigationBarItem(
            icon: const Icon(Icons.home), title: new Text('home')),
        new BottomNavigationBarItem(
            icon: const Icon(Icons.subscriptions),
            title: new Text('subscript')),
        new BottomNavigationBarItem(
            icon: const Icon(Icons.subtitles), title: new Text('active')),
        new BottomNavigationBarItem(
            icon: const Icon(Icons.notifications),
            title: new Text('notfilcation')),
        new BottomNavigationBarItem(
            icon: const Icon(Icons.account_circle), title: new Text('person')),
      ],
      type: BottomNavigationBarType.shifting, //分頁效果
      currentIndex: _selectedIndex,
      fixedColor: Colors.blueGrey, //下方分頁點擊顏色
      onTap: _onItemTapped, //分頁點擊事件
      showSelectedLabels: true, // 顯示已選擇之底部選項
      showUnselectedLabels: true, // 顯示未選擇之底部選項
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}
