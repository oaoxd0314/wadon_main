import 'package:flutter/material.dart';
import 'package:http/http.dart';


class BuildDrawer extends StatefulWidget {
  @override
  _BuildDrawerState createState() => _BuildDrawerState();
}

class _BuildDrawerState extends State<BuildDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: new ListView(
        children: <Widget>[
          DrawerHeader(child:Text('123'),),
        //   UserAccountsDrawerHeader(
        //     currentAccountPicture: CircleAvatar(
        //   backgroundImage: AssetImage('image/man.jpg'),
        // ),
        //     accountEmail: Text('TheHandsomeguy@4real.com'),
        //     accountName: Text('金城武'),
        //   )
        ],
      ) 
    );
  }
}
