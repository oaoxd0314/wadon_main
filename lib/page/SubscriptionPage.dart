import 'package:flutter/material.dart';

class SubscriptionPage extends StatefulWidget{
  @override
  _SubscriptionPageState createState() => _SubscriptionPageState();
}

class _SubscriptionPageState extends State<SubscriptionPage>{
  @override
  Widget build(BuildContext context)
  {
    return new Scaffold
    (
      body: new Center
      (
        child: new Text("這是訂閱"),
      ),
    );
  }
}