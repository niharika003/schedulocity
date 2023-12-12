import 'package:flutter/material.dart';
class Event {
  final int id;
  final String title;
  final DateTime from;
  final DateTime to;
  final Color backgroundColor;

  const Event({
     this.id,
     this.title,
    this.from,
    this.to,
    this.backgroundColor = const Color(0xff5b418f),
  });
  Map<String, dynamic> toMap() {
    return {
      'id' : id,
      'title': title,
      'from' : from,
      'to' : to,
      'backgroundColor' : backgroundColor,
    };
  }
}

