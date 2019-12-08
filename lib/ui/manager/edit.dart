import 'package:flutter/material.dart';
import 'package:wadone_main/models/detail.dart';

class Edit extends StatefulWidget {
  final Detail detail;
  Edit({Key key, @required this.detail}) : super(key: key);

  @override
  _EditState createState() => _EditState();
}

class _EditState extends State<Edit> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar : AppBar(
      leading: Builder(builder: (BuildContext context) {
        return IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            size: 30.0,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        );
      }),
      title: Text('Manager'),
    ),
    body: Container(),
      
    );
  }
}