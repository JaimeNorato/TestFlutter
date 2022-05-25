import 'package:flutter/material.dart';
import 'package:test_flutter/test1/repository/island_repository.dart';

class Islands extends StatefulWidget {
  const Islands({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _IslandsState();
}

class _IslandsState extends State<Islands> {
  final TextEditingController _textNumberController = TextEditingController();
  // final TextEditingController _textNumberController = TextEditingController();

  late IslandRepository _islandRepository;
  late List<List<int>> mapIslands;
  late int totalIslands = 0;
  late bool existMap = false;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Islas'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              controller: _textNumberController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                hintText: 'Ingrese el número de islas',
              ),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              child: const Text('Mostrar'),
              onPressed: () {
                _islandRepository = IslandRepository(int.parse(_textNumberController.text));
                setState(() {
                  mapIslands = _islandRepository.generateMap();
                  totalIslands = _islandRepository.countIslands();
                  existMap = true;
                });
              },
            ),
            const SizedBox(height: 15),
            Text(
              'Total de islas: $totalIslands',
              style: const TextStyle(fontSize: 20),
            ),
            const SizedBox(height: 15),
            !existMap
              ? Container()
              : buildGraph(size),
          ],
        ),
      ),
    );
  }

  Widget buildGraph(Size size) {
    return Center(
      child: Column(
        children: mapIslands.map((List<int> list) {
          return Row(
            children: list.map((int value) {
              return Container(
                width: size.width / mapIslands.length * 0.2,
                height: size.height / mapIslands.length * 0.2,
                color: value == 1 ? Colors.red : Colors.blue,
                child: TextField(
                  enabled: false,
                  controller: TextEditingController(text: value.toString()),
                ),
              );
            }).toList(),
          );
        }).toList(),
      ),
    );
  }
}