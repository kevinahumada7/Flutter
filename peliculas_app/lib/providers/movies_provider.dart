import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:peliculas_app/models/models.dart';
import 'package:peliculas_app/models/search_response.dart';

// ignore_for_file: avoid_print
class MoviesProvider extends ChangeNotifier {
  final String _apiKey = 'ae1e44d87388c13c6e76d3edd85e400c';
  final String _baseUrl = 'api.themoviedb.org';
  final String _language = 'es-MX';

  List<Movie> onDisplayMovies = [];
  List<Movie> popularMovies = [];
  Map<int, List<Cast>> movieCast = {};
  int _popularPage = 0;

  MoviesProvider() {
    print('MoviesProvider inicializado');
    getOnDisplayMovies();
    getPopularMovies();
  }

  Future<http.Response> _getJsonData(String endpoint, [int page = 1]) async {
    final url = Uri.https(_baseUrl, endpoint,
        {'api_key': _apiKey, 'language': _language, 'page': '$page'});

    final response = await http.get(url);

    return response;
  }

  getOnDisplayMovies() async {
    final response = await _getJsonData('3/movie/now_playing');

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
    _popularPage++;
    final response = await _getJsonData('3/movie/popular', _popularPage);

    if (response.statusCode == 200) {
      print('Request complete, status code: ${response.statusCode}');

      final jsonResponse = PopularResponse.fromJson(response.body);
      popularMovies = [...popularMovies, ...jsonResponse.results];
      notifyListeners();
    } else {
      print('Request failed with status: ${response.statusCode}.');
    }
  }

  Future<List<Cast>> getMovieCast(int movieId) async {
    if (movieCast.containsKey(movieId)) return movieCast[movieId]!;

    final response = await _getJsonData('3/movie/$movieId/credits');

    final creditsResponse = CreditsResponse.fromJson(response.body);
    movieCast[movieId] = creditsResponse.cast;
    return creditsResponse.cast;
  }

  Future<List<Movie>> searchMovie(String query, [int page = 1]) async {
    var url = Uri.https(_baseUrl, '3/search/movie',
        {'api_key': _apiKey, 'language': _language, 'query': query, 'page' : '$page'});

    final response = await http.get(url);
    final searchResponse = SearchResponse.fromJson(response.body);

    return searchResponse.results;
  }
}
