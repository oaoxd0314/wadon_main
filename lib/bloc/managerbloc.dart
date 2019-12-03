import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:rxdart/rxdart.dart';
import 'package:wadone_main/repository/repository.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Managerbloc {
  final _repository=Repository();
  final _clubid = BehaviorSubject<String>();
  final _pid = BehaviorSubject<String>();
  final _pname = BehaviorSubject<String>();
  final _ptitle = BehaviorSubject<String>();
  final _pcontent = BehaviorSubject<String>();
  final _clublimit = BehaviorSubject<String>();
  final _numlimit = BehaviorSubject<String>();
  // final _singup = BehaviorSubject<Timestamp>();
  // final _singend = BehaviorSubject<Timestamp>();
  // final _actend = BehaviorSubject<Timestamp>();
  // final _actstart = BehaviorSubject<Timestamp>();
  // final _statue = BehaviorSubject<String>();
  final _showProgress = BehaviorSubject<bool>();  

  Observable<String> get pid => _pid.stream;
  Observable<String> get pname => _pname.stream;
  Observable<String> get clubid => _clubid.stream;
  Observable<String> get ptitle => _ptitle.stream;
  Observable<String> get pcontent => _pcontent.stream;
  Observable<String> get clublimit => _clublimit.stream;
  Observable<String> get numlimit => _numlimit.stream;
  // Observable<Timestamp> get singup => _singup.stream;
  // Observable<Timestamp> get singend => _singend.stream;
  // Observable<Timestamp> get actend => _actend.stream;
  // Observable<Timestamp> get actstart => _actstart.stream;
  // Observable<String> get statue => _statue.stream;
  Observable<bool> get showProgress => _showProgress.stream;

//change data
  Function(String) get changeid => _pid.sink.add;
  Function(String) get changepname => _pname.sink.add;
  Function(String) get changeclubid => _clubid.sink.add;
  Function(String) get changeptitle => _ptitle.sink.add;
  Function(String) get changepcontent => _pcontent.sink.add;
  Function(String) get changeclublimit => _clublimit.sink.add;
  Function(String) get changenumlimit => _numlimit.sink.add;
  // Function(Timestamp) get changesingup => _singup.sink.add;
  // Function(Timestamp) get changesingend => _singend.sink.add;
  // Function(Timestamp) get changeactend => _actend.sink.add;
  // Function(Timestamp) get changeactstart => _actstart.sink.add;

  // final _validateid = StreamTransformer<String, String>.fromHandlers(
  //     handleData: (String id, sink) {
  //   if (RegExp(r'[!@#<>?":_`~;[\]\\|=+)(*&^%0-9-]').hasMatch(id)) {
  //     sink.addError(Text('error'));
  //   } else {
  //     sink.add(id);
  //   }
  // });

  void submit() {
    _showProgress.sink.add(true);
    _repository.clubadd(_pid.value, _clubid.value);
    _repository.
    uploadAct(_clubid.value,_pname.value,_ptitle.value,_pcontent.value,_clublimit.value,_numlimit.value,_pid.value)
        .then((value) {
      _showProgress.sink.add(false);
    });
  }


  void dispose() async {
    await _pid.drain();
    _pid.close();
    await _pname.drain();
    _pname.close();
    await _ptitle.drain();
    _ptitle.close();
    await _clubid.drain();
    _clubid.close();
    await _clublimit.drain();
    _clublimit.close();
    await _pcontent.drain();
    _pcontent.close();
    await _numlimit.drain();
    _numlimit.close();
    await _showProgress.drain();
    _showProgress.close();
  }

  
}