import 'package:escuelajs/src/app.dart';
import 'package:escuelajs/src/helpers/api_helper.dart';
import 'package:flutter/material.dart';

void main() {
  ApiHelper.initialize();
  runApp(const MyApp());
}
