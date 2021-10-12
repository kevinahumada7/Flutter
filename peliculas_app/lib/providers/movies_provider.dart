import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'package:peliculas_app/models/now_playing_response.dart';

// ignore_for_file: avoid_print
class MoviesProvider extends ChangeNotifier {

  final String _apiKey = 'ae1e44d87388c13c6e76d3edd85e400c';
  final String _baseUrl = 'api.themoviedb.org';
  final String _language = 'es-US';


  MoviesProvider() {
    print('MoviesProvider inicializado');
    getOnDisplayMovies();
  }

  getOnDisplayMovies() async {
    var url = Uri.https(_baseUrl, '3/movie/now_playing', {
      'api_key': _apiKey,
      'language': _language,
      'page': '1'
    });

    final response = await http.get(url);

    if (response.statusCode == 200) {
      print('Request complete, status code: ${response.statusCode}');

      //final Map<String, dynamic> jsonResponse = json.decode(response.body);
      //final jsonResponse = json.decode(response.body) as Map<String, dynamic>;
      final jsonResponse = NowPlayingResponse.fromJson(response.body);
      print(jsonResponse.results[0].title);

    } else {
      print('Request failed with status: ${response.statusCode}.');
    }
  }
}