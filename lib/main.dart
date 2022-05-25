import 'package:flutter/material.dart';
import 'package:test_flutter/my_home.dart';
import 'package:test_flutter/routes.dart';
import 'package:test_flutter/styles/commons.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter test',
      initialRoute: 'home',
      routes: getRoutes(),
      theme: ThemeData(
        primarySwatch: Commons.primaryColor,
      ),
      home: MyHome(),
    );
  }
}