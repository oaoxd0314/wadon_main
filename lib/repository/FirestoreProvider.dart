import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreProvider {
  Firestore _firestore = Firestore.instance;

  Stream<QuerySnapshot> pageList() {
    return _firestore
        .collection("club")
        .snapshots();
  }


  ///that club's all active
  Stream<QuerySnapshot> actList(String aid){
     return _firestore
     .collection("posts")
     .where("p_id" ,isEqualTo: aid)
     .snapshots();
  }
  
  Future<void> clubadd(String actid,String clubid){
    return _firestore
    .collection('club')
    .document(clubid)
    .setData({
      'c_id':clubid,
      'posts':{
        'key{'+actid+'}':actid}
    });
  }

  Future<void> creat(String documentId,){
    return _firestore
    .collection("posts")
    .document(documentId).updateData({
      '':'',
    });
  }

  Future<void> join(String documentId,num idcount,String user ){
    return _firestore
    .collection('post')
    .document(documentId)
    .setData({
      'id':idcount+1,
      'userList':user,
    });
  }

  Future<void> userjoin(String actid,String userid){
    return _firestore
    .collection('user')
    .document(userid)
    .setData({
      'actlist':actid
    });
  }
///END ACT DO something

Future<void> changeStatue(String actid,String statue){
  return _firestore
  .collection('posts')
  .document(actid)
  .updateData({'statue':statue});
}

Future<void> uploadAct(String clubid,String name,String title,String content,String clublimit,String numlimit,String actid){
  return _firestore
  .collection('posts')
  .document(actid)
  .setData({
    'p_id':actid,
    'club_id':clubid,
    'p_content':content,
    'p_name':name,
    'p_title':title,
    'num_limit':numlimit,
    'club_limit':clublimit
  });
}
  


}