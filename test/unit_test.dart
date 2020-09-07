import 'dart:io';

import 'package:flutter_bloc_pattern_scratch/models/anime.dart';
import 'package:flutter_bloc_pattern_scratch/services/anime_service.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:http/http.dart' as http;

// Create a MockClient using the Mock class provided by the Mockito package.
// Create new instances of this class in each test.
class MockClient extends Mock implements http.Client {}

main() {
  // Tests go here
  group('API services', () {
    test("return a list of animes", () async {
      final client = MockClient();
      when(client.get(
              'https://api.jikan.moe/v3/search/anime?q=Cowboy%20Bebop&limit=4'))
          .thenAnswer((_) async => http.Response(
                  '{"results":[{"mal_id":1,"url":"https:\/\/myanimelist.net\/anime\/1\/Cowboy_Bebop","image_url":"https:\/\/cdn.myanimelist.net\/images\/anime\/4\/19644.jpg?s=bb1e96eb0a0224a57aa45443eab92575","title":"Cowboy Bebop","airing":false,"synopsis":"In the year 2071, humanity has colonized several of the planets and moons of the solar system leaving the now uninhabitable surface of planet Earth behind. The Inter Solar System Police attempts to ke...","type":"TV","episodes":26,"score":8.79,"start_date":"1998-04-03T00:00:00+00:00","end_date":"1999-04-24T00:00:00+00:00","members":1095199,"rated":"R"},{"mal_id":5,"url":"https:\/\/myanimelist.net\/anime\/5\/Cowboy_Bebop__Tengoku_no_Tobira","image_url":"https:\/\/cdn.myanimelist.net\/images\/anime\/1439\/93480.jpg?s=217164eb9dcb906162f44881547dd22b","title":"Cowboy Bebop: Tengoku no Tobira","airing":false,"synopsis":"Another day, another bounty\u2014such is the life of the often unlucky crew of the Bebop. However, this routine is interrupted when Faye, who is chasing a fairly worthless target on Mars, witnesses an oil...","type":"Movie","episodes":1,"score":8.39,"start_date":"2001-09-01T00:00:00+00:00","end_date":"2001-09-01T00:00:00+00:00","members":250929,"rated":"R"},{"mal_id":4037,"url":"https:\/\/myanimelist.net\/anime\/4037\/Cowboy_Bebop__Yose_Atsume_Blues","image_url":"https:\/\/cdn.myanimelist.net\/images\/anime\/10\/54341.jpg?s=708eacbb267db10ba6f54be159a1a918","title":"Cowboy Bebop: Yose Atsume Blues","airing":false,"synopsis":"Due to the violence portrayed in the Cowboy Bebop world and violence in Japanese schools, the series was briefly cancelled and an extra session was created as a final episode to the first thirteen epi...","type":"Special","episodes":1,"score":7.44,"start_date":"1998-06-26T00:00:00+00:00","end_date":"1998-06-26T00:00:00+00:00","members":32828,"rated":"R"}]}',
                  200,
                  headers: {
                    HttpHeaders.contentTypeHeader:
                        'application/json; charset=utf-8',
                  }));

      expect(await getData("Cowboy Bebop", client), isA<List<Anime>>());
    });
  });
}
