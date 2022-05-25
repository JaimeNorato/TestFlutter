import 'package:flutter/material.dart';

class HappyHours extends StatefulWidget {
  const HappyHours({Key? key}) : super(key: key);

  @override
  State<HappyHours> createState() => _HappyHoursState();
}

class _HappyHoursState extends State<HappyHours> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Happy Hours'),
      ),
      body: Center(
        child: Text('Happy Hours'),
      ),
    );
  }
}