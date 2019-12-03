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
  final _clubId = BehaviorSubject<String>();

  Function(String) get thisactiveId => _activeId.sink.add;
  Function(String) get clubId => _clubId.sink.add;

  Stream<QuerySnapshot> activeList() {
    return _repository.pageList();
  }

  ///that club's all active
  Stream<QuerySnapshot> allact() {
    return _repository.actList(_activeId.value);
  }

//dispose open sink
  void dispose() async {
    await _activeId.drain();
    _activeId.close();
    await _clubId.drain();
    _clubId.close();
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
        String club=document.data['p_id'];
        String description=document.data['p_content'];
        String title=document.data['p_title'];
        String pname=document.data['p_name'];
        Timestamp actend=document.data['act_end'];
        Timestamp actstart=document.data['act_start'];
        Detail data =Detail(club,title,description,pname,actend,actstart);
        detaillist.add(data);
      });
      return detaillist;
    }
    else{
      return null;
    }


    
  }
}
