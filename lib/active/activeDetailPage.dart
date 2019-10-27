import 'package:flutter/material.dart';

class ActiveDetailPage extends StatefulWidget{
  @override
  _ActiveDetailPageState createState() => _ActiveDetailPageState();
}

class _ActiveDetailPageState extends State<ActiveDetailPage>{
  @override
  Widget build(BuildContext context)
  {
    return new Scaffold
    (
      appBar: AppBar(
        leading: Builder(builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(Icons.arrow_back_ios,size: 30.0,),
              onPressed: (){
                Navigator.pop(context); 
              },
            );
          }),
          title: Text("活動細節"),
      ),
      body: new Center
      (
        child: new Text("這是活動細節"),
      ),
    );
  }
}