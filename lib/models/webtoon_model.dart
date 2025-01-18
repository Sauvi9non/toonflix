import 'package:flutter/material.dart';

class WebtoonModel {
  late final String title, thumb, id;

  // WebtoonModel({
  //   required this.title,
  //   required this.thumb,
  //   required this.id,
  // });

  //named constructor
  WebtoonModel.fromJson(Map<String, dynamic> json)
      : title = json['title'],
        thumb = json['thumb'],
        id = json['id'];
}
