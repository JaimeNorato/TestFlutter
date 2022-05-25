import 'dart:convert';

import 'package:test_flutter/test2/models/gif.dart';
import 'package:http/http.dart' as http;

class HappyRepository {

  final Uri uri = Uri.parse('https://api.giphy.com/v1/gifs/search?api_key=HXqbAfy8oEU42HnmCPGLS44rSQE1OVxi&q=restaurants&limit=25&offset=0&rating=g&lang=es');

  Future<List<Gif>> getGifs() async {
    final response = await http.get(uri);
    late List<Gif> gifs = [];
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      data['data'].forEach((element) {
        gifs.add(Gif(url: element['images']['downsized']['url'], title: element['title']));
      });
    } else {
      throw Exception('Failed to load Gifs');
    }
    return gifs;
  }
}