import 'package:flutter/material.dart';
import 'package:test_flutter/my_home.dart';
import 'package:test_flutter/test1/screens/islands.dart';
import 'package:test_flutter/test2/screens/happy_hours.dart';

Map<String, WidgetBuilder> getRoutes() {
  return {
    'home': (context) => MyHome(),
    'islands': (context) => const Islands(),
    'happy_hours': (context) => const HappyHours(),
  };
}