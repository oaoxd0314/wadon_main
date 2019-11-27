import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreProvider {
  Firestore _firestore = Firestore.instance;

  Stream<QuerySnapshot> pageList() {
    return _firestore
        .collection("club")
        .snapshots();
  }

  Stream<DocumentSnapshot> detailList(String documentId,String actid ){
    return _firestore
    .collection("club")
    .document(documentId)
    .collection("posts")
    .document(actid)
    .snapshots();
  }

  ///club's all active
  Stream<QuerySnapshot> actList(String documentId,String aid){
     return _firestore
     .collection("club")
     .document(documentId)
     .collection("posts")
     .where("a_id" ,isEqualTo: aid)
     .snapshots();
  }

  


}