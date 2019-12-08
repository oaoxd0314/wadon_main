import 'package:cloud_firestore/cloud_firestore.dart';

import 'FirestoreProvider.dart';

class Repository {
  final _firestoreProvider = FirestoreProvider();

  Stream<QuerySnapshot> pageList() => _firestoreProvider.pageList();

  Stream<QuerySnapshot> actList(String clubid,String actid) => _firestoreProvider.actList(clubid,actid) ;

  Future<void> clubadd(String actid,String clubid) =>_firestoreProvider.clubadd(actid,clubid);

  Future<void> changeStatue(String actid,String statue)=> _firestoreProvider.changeStatue(actid, statue);

  Future<void> uploadAct(String clubid,String name,String title,String content,String clublimit,String numlimit,String actid,String statue,String localtion, String note) =>
   _firestoreProvider.uploadAct(clubid,name,title,content,clublimit,numlimit,actid,statue,localtion,note);

  void clubListDelete(String activeId, String thatclubid) => _firestoreProvider.clubListDelete(activeId,thatclubid);

  void deletePosts(String activeId, String thatclubid) => _firestoreProvider.deletePosts(activeId,thatclubid);
}
