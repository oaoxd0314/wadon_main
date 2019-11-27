class Active {
  final String _title;
  final String _description;
  final String _club;
  int _id;

  Active(this._club,this._title, this._description,){
    this._id = DateTime.now().millisecondsSinceEpoch;
  }

  String get title => _title;
  String get description => _description;
  String get club => _club;
  int get id => _id;

}

// class PostModel {
//   final String _description;
//   final String _aId;
//   final String _aName;
//   int _id;

//   PostModel( this._description,this._aId,this._aName){
//     this._id = DateTime.now().millisecondsSinceEpoch;
//   }

//   String get description => _description;
//   String get title => _aId;
//   String get aName => _aName;
//   int get id => _id;

// }
