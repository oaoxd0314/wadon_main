import 'package:flutter/material.dart';
import 'package:wadone_main/ui/manager/manager.dart';
import 'package:wadone_main/ui/user/user.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          RaisedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Manager(),
                ),
              );
            },
            child: Text('Manager Page'),
          ),
          RaisedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => User(),
                ),
              );
            },
            child: Text('User Page'),
          ),
        ],
      ),
    );
  }
}
