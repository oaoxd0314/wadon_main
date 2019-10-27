import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:wadone_main/club/clubpage.dart';

class SubscriptionPage extends StatefulWidget {
  @override
  _SubscriptionPageState createState() => _SubscriptionPageState();
}

class _SubscriptionPageState extends State<SubscriptionPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: <Widget>[
          ExpansionTile(
            title: Text('全部社團'),
            initiallyExpanded: true,
            children: <Widget>[
              ListTile(
                title: const Text('典雅國樂社'),
                onTap: () {
                  {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Clubpage(),
                      ),
                    );
                  }
                  setState(() {});
                },
              ),
            ],
            leading: CircleAvatar(child: Text("全")),
          ),
        ],
      ),
    );
  }
}
