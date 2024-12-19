import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/joke.dart';
import '../utils/cache_helper.dart';

class JokesService {
  final CacheHelper _cacheHelper = CacheHelper();
  final String apiUrl = 'https://official-joke-api.appspot.com/jokes/random/5';

  Future<List<Joke>> fetchJokes() async {
    try {
      final response = await http
          .get(Uri.parse(apiUrl))
          .timeout(Duration(seconds: 2), onTimeout: () {
        throw Exception('Request timed out after 7 seconds');
      });

      if (response.statusCode == 200) {
        final List<dynamic> jokesJson = jsonDecode(response.body);
        return jokesJson.map((json) => Joke.fromJson(json)).toList();
      } else {
        throw Exception('Failed to fetch jokes');
      }
    } catch (e) {
      throw Exception('Failed to fetch jokes: $e');
    }
  }

  Future<void> cacheJokes(List<Joke> jokes) => _cacheHelper.saveJokesToCache(jokes);

  Future<List<Joke>> getCachedJokes() => _cacheHelper.getCachedJokes();
}
