import 'package:flutter/material.dart';
import 'dart:math';
///uncomplete 
///put something data cloum name here
///logic 
class Helper {
  static const pageNames = [
    'Brioni',
    'HERMES',
    'Louis Vuitton',
    'Bulgari',
    'TAG Heuer',
    'Benefit Cosmetics',
    'Estee Lauder',
    'Aramis',
    'Van Cleef',
    'Jaeger-LeCoultre',
    'Ray-Ban',
    'Pomellato',
    'Ralph Lauren',
    'Calvin Klein',
    'Manolo Blahnik',
    'Jimmy Choo',
    'Roger Vivier',
    'Salvatore Ferragamo',
    'CHEANEY',
    'EDWARD GREEN',
    'CHANEL',
    'Bordelle'
  ];
  ///page_memory.addPage need this 
  static Map<String, dynamic> makeRandCatalog(id) {
    var rand = Random();
    var color = Colors.primaries[id % Colors.primaries.length];
    Map<String, dynamic> randomJson = {
      "id": id + 1,
      "name": pageNames[id % pageNames.length],
      "color": int.parse('0x${color.value.toRadixString(16)}'),
      "price": rand.nextInt(100)
    };

    return randomJson;
  }
}
