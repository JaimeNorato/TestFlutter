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
  late Map<String, int> totals = {};
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
              style: const TextStyle(fontSize: 24),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              child: const Text('Mostrar'),
              onPressed: () {
                _islandRepository = IslandRepository(int.parse(_textNumberController.text));
                setState(() {
                  mapIslands = _islandRepository.generateMap();
                  totals = _islandRepository.countIslands();
                  existMap = true;
                });
              },
            ),
            const SizedBox(height: 15),
            Text(
              'Total de vértices de islas: ${totals['vertices']??0}',
              style: const TextStyle(fontSize: 20),
            ),
            const SizedBox(height: 15),
            Text(
              'Total de islas mapeadas: ${totals['islands']??0}',
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
    return Padding(
      padding: EdgeInsets.only(left: size.width * 0.2, right: size.width * 0.1),
      child: Column(
        children: buildMap(size),
      ),
    );
  }

  List<Row> buildMap(Size size) {
    final List<Row> rows = [];
    for(int i = 0; i < mapIslands.length; i++) {
      final List<Widget> widgets = [];
      for (int j = 0; j < mapIslands[i].length; j++) {
        widgets.add(
          Container(
            width: size.width / mapIslands.length * 0.5,
            height: size.height / mapIslands.length * 0.3,
            color: mapIslands[i][j] == 1 ? Colors.red : Colors.blue,
            child: TextField(
              controller: TextEditingController(text: mapIslands[i][j].toString()),
              onChanged: (value) {
                setState(() {
                  mapIslands[i][j] = int.parse(value.toString());
                  _islandRepository.mapIslands = mapIslands;
                  totals = _islandRepository.countIslands();
                });
              },
            ),
          ),
        );
      }
      rows.add(Row(children: widgets));
    }
    return rows;
  }
}