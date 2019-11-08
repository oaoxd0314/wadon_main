import 'package:flutter/material.dart';
import 'package:wadone_main/models/page.dart';
import 'package:wadone_main/repository/page.dart';
import 'dart:async';

class PageBloc with ChangeNotifier {
  final _pageRespository = PageRespository();
  List<Page> _items = [];
  List<Page> get page => _items;

  PageBloc() {
    init();
  }
  init() async {
    await getData();
  }

  Future getData() async {
    _items = await _pageRespository.getpage();
    notifyListeners();
  }
}
