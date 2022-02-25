import 'dart:convert';

import 'package:get/get.dart';


class Hospital {
  final String name;
  final String waitingTime;

  Hospital({required this.name, required this.waitingTime});

  factory Hospital.fromJson(dynamic json) {
    return Hospital(name: json['hospName'], waitingTime: json['waitTime']);
  }

}
