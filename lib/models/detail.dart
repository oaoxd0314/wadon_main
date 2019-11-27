import 'package:cloud_firestore/cloud_firestore.dart';
class Detail {
  final String _title;
  final String _description;
  final String _club;
  final String _aname;
  final Timestamp _actend;
  final Timestamp __actstart;
  int _id;

  Detail(this._club,this._title, this._description,this._aname,this._actend,this.__actstart){
    this._id = DateTime.now().millisecondsSinceEpoch;
  }

  String get title => _title;
  String get description => _description;
  String get club => _club;
  String get aname => _aname;
  Timestamp get actend => _actend;
  Timestamp get actstart => __actstart;
  int get id => _id;

}