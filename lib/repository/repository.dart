import 'package:cloud_firestore/cloud_firestore.dart';

import 'FirestoreProvider.dart';

class Repository {
  final _firestoreProvider = FirestoreProvider();

  Stream<QuerySnapshot> pageList() => _firestoreProvider.pageList();

  Stream<QuerySnapshot> actList(String actid) => _firestoreProvider.actList(actid) ;

  Future<void> clubadd(String actid,String clubid) =>_firestoreProvider.clubadd(actid,clubid);

  Future<void> changeStatue(String actid,String statue)=> _firestoreProvider.changeStatue(actid, statue);

  Future<void> uploadAct(String clubid,String name,String title,String content,String clublimit,String numlimit,String actid) =>
   _firestoreProvider.uploadAct(clubid,name,title,content,clublimit,numlimit,actid);
}
