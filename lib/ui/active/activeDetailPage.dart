import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wadone_main/models/active.dart';
import 'package:wadone_main/models/detail.dart';
import 'package:wadone_main/bloc/pagebloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:rxdart/rxdart.dart';
class ActiveDetailPage extends StatefulWidget {
  final Active active;
  ActiveDetailPage({Key key, @required this.active}) : super(key: key);
   

  @override
  _ActiveDetailPageState createState() =>_ActiveDetailPageState();
}

class _ActiveDetailPageState extends State<ActiveDetailPage> {

  var id;

  @override
  void initState() {
    super.initState();
  }

  void didChangeDependencies() {
    super.didChangeDependencies();
    var _bloc = Provider.of<PageBloc>(context);
    _bloc.thisactiveId(widget.active.description);
    _bloc.docId(widget.active.club);
  }

  

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar:_appbar(),
      body: Consumer<PageBloc>(
        builder:(context, pageBloc,_)=>
        StreamBuilder(
          stream: pageBloc.allact(),
          builder: (BuildContext context,AsyncSnapshot<QuerySnapshot> snap){
           if(snap.hasData){
             List<DocumentSnapshot> docs = snap.data.documents;
             List<Detail> detailsList = pageBloc.detailToList(docList: docs);
              if (detailsList.isNotEmpty) {
                    return _container(detailsList);
                  } else {
                   return Text("data doesn't exist");
                  }
            }
          return Center(
                child: CircularProgressIndicator(),
              );
        },
      )) 
      
      
      // StreamBuilder(
      //   stream: _bloc.detailList(),
      //   builder: (BuildContext context,AsyncSnapshot<QuerySnapshot> snap){
      //     return Container(
            
      //     );
      //   })
    );
  }

  Widget _appbar(){
    return AppBar(
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
        title: Text(widget.active.title),
      );
  }

  Widget _container(List<Detail> detailsList){
    return ListView.separated(
      separatorBuilder: (BuildContext context, int index) => Divider(),
      itemCount: detailsList.length,
      itemBuilder: (context, index) {
        return Container(
          child: Row(
            children: <Widget>[
              Text(detailsList[index].aname),
              Text(detailsList[index].club),
              Text(detailsList[index].description),
              Text(detailsList[index].title),
              ],
          )
        );
      });
    }
    

  void matchId() {}
}
