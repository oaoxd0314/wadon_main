import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:wadone_main/models/active.dart';
import 'package:wadone_main/models/detail.dart';
import 'package:wadone_main/repository/repository.dart';
import 'package:rxdart/rxdart.dart';
import 'dart:async';

class PageBloc with ChangeNotifier {
  final _repository = Repository();
  final _activeId = BehaviorSubject<String>();
  final _docId = BehaviorSubject<String>();

  Function(String) get thisactiveId => _activeId.sink.add;
  Function(String) get docId => _docId.sink.add;

  Stream<QuerySnapshot> activeList() {
    return _repository.pageList();
  }

  // Stream<QuerySnapshot> detailList(_activeId,String aid){
  //   if
  //   return _repository.detailList(aid, _activeId);
  // }

  Stream<DocumentSnapshot> detailactive(String actid) {
    return _repository.detailList(_docId.value, actid);
  }

  ///club's all active
  Stream<QuerySnapshot> allact() {
    return _repository.actList(_docId.value, _activeId.value);
  }

  // List matchid() {
  //   if (allact() != null) {
  //     StreamBuilder(
  //       stream: allact(),
  //       builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snap) {
  //         List<DocumentSnapshot> docs = snap.data.documents;
  //         docs.forEach((document) {
  //           if (_activeId == document.data['a_id']) {
  //            return document.data['a_id'];
  //           }
  //         });
  //       },
  //     );
  //   }
  // }

//dispose open sink
  void dispose() async {
    await _activeId.drain();
    _activeId.close();
    await _docId.drain();
    _docId.close();
  }

  List mapToList({DocumentSnapshot doc, List<DocumentSnapshot> docList}) {
    if (docList != null) {
      List<Active> activeList = [];
      docList.forEach((document) {
        String club = document.data['c_id'];
        Map<String, String> active = document.data['posts'] != null
            ? document.data['posts'].cast<String, String>()
            : null;
        if (active != null) {
          active.forEach((title, description) {
            Active active = Active(club, title, description);
            activeList.add(active);
          });
        }
      });
      return activeList;
    }
  }

  List detailToList({DocumentSnapshot doc, List<DocumentSnapshot> docList}) {
    if(docList != null){
      List<Detail> detaillist=[];
      docList.forEach((document){
        String club=document.data['a_id'];
        String description=document.data['a_description'];
        String title=document.data['title'];
        String aname=document.data['a_name'];
        Timestamp actend=document.data['act_end'];
        Timestamp actstart=document.data['act_start'];
        Detail data =Detail(club,title,description,aname,actend,actstart);
        detaillist.add(data);
      });
      return detaillist;
    }
    else{
      return null;
    }
  }


  bool matchId(int id) {
    if (id == 0) {
      return true;
    } else {
      return false;
    }
  }
}
