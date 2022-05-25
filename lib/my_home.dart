import 'package:flutter/material.dart';
import 'package:test_flutter/styles/commons.dart';

class MyHome extends StatefulWidget {

  MyHome({Key? key}) : super(key: key);

  late String title = 'Test Flutter';

  @override
  State<MyHome> createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
    
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Bienvenido', style: Commons.textTitle),
                  const Text('Selecciona una opción', style: Commons.textSubTitle),
                  const SizedBox(height: 40),
                  Center(
                    child: ElevatedButton(
                      style: Commons.buttonStyle,
                      onPressed: () {
                        Navigator.of(context).pushNamed('islands');
                      },
                      child: Wrap(
                        children: [
                          Text('Test 1'.toUpperCase(), style: Commons.textButtons, textAlign: TextAlign.center),
                          const Icon(Icons.arrow_forward_ios, color: Colors.white, size: 18),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 15),
                  Center(
                    child: ElevatedButton(
                      style: Commons.buttonStyle,
                      onPressed: () {
                        Navigator.of(context).pushNamed('happy_hours');
                      },
                      child: Wrap(
                        children: [
                          Text('Test 2'.toUpperCase(), style: Commons.textButtons, textAlign: TextAlign.center),
                          const Icon(Icons.arrow_forward_ios, color: Colors.white, size: 18),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),// This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
