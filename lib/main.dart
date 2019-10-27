import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:wadone_main/page/HomePage.dart';
import 'package:wadone_main/page/Profile.dart';
import 'package:wadone_main/page/ActivityPage.dart';
import 'package:wadone_main/page/SubscriptionPage.dart';
import 'package:wadone_main/page/NotificationPage.dart';
import 'package:wadone_main/models/drawer.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  // MyHomePage({Key key, this.title}) : super(key: key);
  // final String title;
  
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  
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
        data:Theme.of(context).copyWith(
            canvasColor: Colors.teal[200], 
          ),
        child: buildNavigationBar(),
      ),
    );
  }

  // Widget buildDrawer(){
  //   return Drawer(
  //     child: new ListView(
  //       children: <Widget>[
  //         new DrawerHeader(
  //           child: new Text("drawerhead"),
  //         ),
  //       ],
  //     ) 
  //   );
  // }

  Widget buildAppBar(){
    return AppBar(
        leading: Builder(builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(Icons.menu,size: 30.0,),
              onPressed: (){
                Scaffold.of(context).openDrawer(); //點擊menu打開Drawer
              },
            );
          }),
        title: Text("wadon app"),
      );
  }

  Widget buildNavigationBar(){
    return BottomNavigationBar(        
          items: <BottomNavigationBarItem>[        
            new BottomNavigationBarItem(
              icon: const Icon(Icons.home),
              title: new Text('home')),
            new BottomNavigationBarItem(
              icon: const Icon(Icons.subscriptions),
              title: new Text('subscript')),
             new  BottomNavigationBarItem(
              icon: const Icon(Icons.subtitles),
              title: new Text('active')),
              new BottomNavigationBarItem(
              icon: const Icon(Icons.notifications),
              title: new Text('notfilcation')),
            new BottomNavigationBarItem(
              icon: const Icon(
                Icons.account_circle),
              title: new Text('person')),
          ],
          type:BottomNavigationBarType.shifting, //分頁效果
          currentIndex: _selectedIndex,
          fixedColor: Colors.blueGrey, //下方分頁點擊顏色
          onTap: _onItemTapped,   //分頁點擊事件
          showSelectedLabels: true,   // 顯示已選擇之底部選項
          showUnselectedLabels: true, // 顯示未選擇之底部選項
          );
  } 
  void _onItemTapped(int index){
    setState((){
      _selectedIndex = index;
    });
  }

}
