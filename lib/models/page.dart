import 'package:flutter/material.dart';
/// put something active need
/// it will show on page
@immutable
class Page {
  final int title;
  final String body;

  Page(this.body,this.title);

  Page.fromJson(Map<String, dynamic> json)
      : title = json['title'],
        body = json['body'];

  Map<String, dynamic> toJson() => {
        'title': title,
        'body': body,
      };

}