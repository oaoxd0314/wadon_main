import 'package:cloud_firestore/cloud_firestore.dart';

import 'FirestoreProvider.dart';

class Repository {
  final _firestoreProvider = FirestoreProvider();

  Stream<QuerySnapshot> pageList() => _firestoreProvider.pageList();

  Stream<QuerySnapshot> actList(String documentId,String actid) => _firestoreProvider.actList(documentId,actid) ;

  Stream<DocumentSnapshot> detailList(String aid,id) => _firestoreProvider.detailList(aid, id);

}
