import 'package:flutter/material.dart';

class NotificationPage extends StatefulWidget{
  @override
  _NotificationPageState createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage>{
  @override
  Widget build(BuildContext context)
  {
    return new Scaffold
    (
      body: new Center
      (
        child: new Text("這是通知"),
      ),
    );
  }
}