import 'dart:async';
import 'package:flutter_bloc_pattern_scratch/bloc/generic_bloc_provider.dart';
import 'package:flutter_bloc_pattern_scratch/models/anime.dart';
import 'package:flutter_bloc_pattern_scratch/services/anime_service.dart';
import 'package:http/http.dart';

class AnimeBloc extends BlocBase {
  final _animeServiceController = StreamController<List<Anime>>();
  StreamSink<List<Anime>> get _animeList => _animeServiceController.sink;

  Stream<List<Anime>> get animeList => _animeServiceController.stream;

  void getAnimes(String name, Client client) async {
    _animeList.add(await getData(name, client));
  }

  @override
  void dispose() {
    _animeServiceController.close();
  }
}
