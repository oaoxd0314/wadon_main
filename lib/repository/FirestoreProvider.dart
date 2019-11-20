import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreProvider {
  Firestore _firestore = Firestore.instance;


  Stream<DocumentSnapshot> myGoalList(String documentId) {
    return _firestore.collection("club").document(documentId).snapshots();
  }

  Stream<QuerySnapshot> pageList() {
    return _firestore
        .collection("club")
        .snapshots();
  }


}