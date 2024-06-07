// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class LessonModel {
  final String heading;
  final String iconUrl;
  final List<SingleLessonModel> lessons;
  LessonModel({
    required this.heading,
    required this.iconUrl,
    required this.lessons,
  });
}

class SingleLessonModel {
  final String title;
  final List<RichText> description;

  SingleLessonModel({
    required this.title,
    required this.description,
  });
}
