import 'package:flutter/material.dart';

class Entry {
  final String entryId;
  final String date;
  final String entry;
  final String desc;

  Entry({this.date, this.entry, @required this.entryId, this.desc});

  factory Entry.fromJson(Map<String, dynamic> json) {
    return Entry(
        date: json['date'],
        entry: json['title'],
        entryId: json['entryId'],
        desc: json['desc']);
  }

  Map<String, dynamic> toMap() {
    return {'date': date, 'title': entry, 'entryId': entryId, 'desc': desc};
  }
}
