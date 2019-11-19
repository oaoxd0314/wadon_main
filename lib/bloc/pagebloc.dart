import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:wadone_main/models/active.dart';
import 'package:wadone_main/models/messageForWRONG.dart';
import 'package:wadone_main/repository/repository.dart';
// import 'package:wadone_main/repository/FirestoreProvider.dart';
import 'dart:async';

class PageBloc with ChangeNotifier {
  
final _repository = Repository();
// final _firestoreprovider = FirestoreProvider();

  Stream<QuerySnapshot> activeList() {
    return _repository.pageList();
  }

  List mapToList({DocumentSnapshot doc, List<DocumentSnapshot> docList}) {
    if (docList != null) {
      List<Active> activeList = [];
      docList.forEach((document) {
        String club = document.data['c_id'];
        Map<String, String> active =
            document.data['posts'] != null
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
    // else{
    //   Map<String, String> goals = doc.data['posts'] != null
    //       ? doc.data['posts'].cast<String, String>()
    //       : null;
    //   List<MessageForWRONG> goalList = [];
    //   if (goals != null) {
    //     String wrong = 'wrong';
    //     goals.forEach((title, message) {
    //       MessageForWRONG messageForWRONG = MessageForWRONG(wrong,title,message);
    //       goalList.add(messageForWRONG);
    //     });
    //   }
    //   return goalList;
    // }
    }
}
