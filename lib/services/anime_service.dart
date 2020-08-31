import 'dart:convert';
import 'package:flutter_bloc_pattern_scratch/models/anime.dart';
import 'package:http/http.dart';

Future<List<Anime>> getData(String name) async {
  Response response = await get('https://api.jikan.moe/v3/search/anime?q=$name&limit=4');

  List<dynamic> data = jsonDecode(response.body)['results'];
  List<Anime> animes = List<Anime>();

  for (Map<String, dynamic> animeData in data) {
    animes.add(Anime(
      name: animeData['title'],
      synopsis: animeData['synopsis'],
      episodes: animeData['episodes'],
      score: animeData['score'],
      releaseDate: DateTime.parse(animeData['start_date']),
      imageUrl: animeData['image_url']
    ));
  }

  return animes;
}
