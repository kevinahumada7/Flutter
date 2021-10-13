import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:peliculas_app/models/movie.dart';

import 'package:peliculas_app/models/now_playing_response.dart';
import 'package:peliculas_app/models/popular_response.dart';

// ignore_for_file: avoid_print
class MoviesProvider extends ChangeNotifier {

  final String _apiKey = 'ae1e44d87388c13c6e76d3edd85e400c';
  final String _baseUrl = 'api.themoviedb.org';
  final String _language = 'es-MX';

  List<Movie> onDisplayMovies = [];
  List<Movie> popularMovies = [];

  MoviesProvider() {
    print('MoviesProvider inicializado');
    getOnDisplayMovies();
    getPopularMovies();
  }

  getOnDisplayMovies() async {
    var url = Uri.https(_baseUrl, '3/movie/now_playing', {
      'api_key': _apiKey,
      'language': _language,
      'page': '1'
    });

    final response = await http.get(url);

    //final Map<String, dynamic> jsonResponse = json.decode(response.body);
    //final jsonResponse = json.decode(response.body) as Map<String, dynamic>;
    if (response.statusCode == 200) {
      print('Request complete, status code: ${response.statusCode}');

      final jsonResponse = NowPlayingResponse.fromJson(response.body);
      onDisplayMovies = jsonResponse.results;
      notifyListeners();

    } else {
      print('Request failed with status: ${response.statusCode}.');
    }
  }

  getPopularMovies() async {
    var url = Uri.https(_baseUrl, '3/movie/popular', {
      'api_key': _apiKey,
      'language': _language,
      'page': '1'
    });

    final response = await http.get(url);

    if (response.statusCode == 200) {
      print('Request complete, status code: ${response.statusCode}');

      final jsonResponse = PopularResponse.fromJson(response.body);
      popularMovies = [...popularMovies, ...jsonResponse.results];
      notifyListeners();

    } else {
      print('Request failed with status: ${response.statusCode}.');
    }
  }
}