import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wadone_main/bloc/managerbloc.dart';
import 'package:wadone_main/bloc/pagebloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:wadone_main/models/detail.dart';
import 'package:wadone_main/ui/manager/edit.dart';
import 'package:wadone_main/ui/manager/create.dart';


class Manager extends StatefulWidget {

  Manager({Key key}) : super(key: key);
  @override
  _ManagerState createState() => _ManagerState();
}

class _ManagerState extends State<Manager> {
  Managerbloc _bloc;
  PageBloc _pageBloc;

  @override
  void didChangeDependencies() {
    _bloc = Provider.of<Managerbloc>(context);
    _pageBloc = Provider.of<PageBloc>(context);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
      body: Center(
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                clubINFO()
              ],
            ),
            Row(
              children: <Widget>[
                create()
              ],
            ),
            actlistview()
          ],
        )
      ),
      
    );
  }

  Widget actlistview(){
    return Flexible(
      child: StreamBuilder(
        stream: _bloc.pageList() ,//that club's active
        builder: (BuildContext context,AsyncSnapshot<QuerySnapshot> snap){
          if (snap.hasData) {
                      List<DocumentSnapshot> docs = snap.data.documents;
                      List<Detail> goalsList =
                          _pageBloc.detailToList(docList: docs);
                      if (goalsList.isNotEmpty) {
                        return buildList(goalsList);
                      } else {
                        return Text("data doesn't exist");
                      }
                    }
                    return Center(
                      child: CircularProgressIndicator(),
                    );
        },
      ),
    );
  }

  ListView buildList(List<Detail> goalsList) {
    return ListView.separated(
        separatorBuilder: (BuildContext context, int index) => Divider(),
        itemCount: goalsList.length,
        itemBuilder: (context, index) {
          // final id = goalsList[index].description;
          final detail = goalsList[index]; //catch this active
          return InkWell(
            child: ListTile(
              title: Text(
                detail.title,///活動名稱
                textAlign: TextAlign.left,
                style: TextStyle(fontSize: 24.0,fontWeight: FontWeight.bold,),
              ),
              subtitle: Text('主辦單位 : '+detail.club),///社團名稱
              trailing: Text(
                detail.statue,///活動狀態
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 12.0,
                ),
              ),
              leading: Builder(
                builder: (BuildContext context) {
                  return IconButton(
                    icon: const Icon(
                      Icons.delete_forever,
                    ),
                    onPressed: () {
                      ///only act owner can do this method
                      /// so give this method an club's id
                      String clubid = 'nkust_IC';

                      ///fortemp this will catch that club's id(after singing)
                      _pageBloc.remove(clubid);

                      ///add to personal list
                    },
                  );
                },
              ),
            ),
            onTap: (){
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Edit(
                    detail: detail,
                  ),
                ),
              );
            },
          );
        });
  }

  Widget create(){
    return RaisedButton.icon(
      onPressed: (){
        Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Create(),
                ),
              );
      },
      icon: Icon(Icons.control_point),
      label: Text('新增活動'),
      color: Colors.orangeAccent,
    );
  }

  Widget clubINFO(){
    return Expanded(
    child:Container(
      height: 250,
      width: 500,
      padding: const EdgeInsets.all(8.0),
      child: Container(
        ///build info
      ),
    )
    );
  }



}