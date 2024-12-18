import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/joke.dart';
import '../utils/cache_helper.dart';

class JokesService {
  final CacheHelper _cacheHelper = CacheHelper();
  final String apiUrl = 'https://official-joke-api.appspot.com/jokes/random/5';

  Future<List<Joke>> fetchJokes() async {
    final response = await http.get(Uri.parse(apiUrl));
    if (response.statusCode == 200) {
      final List<dynamic> jokesJson = jsonDecode(response.body);
      return jokesJson.map((json) => Joke.fromJson(json)).toList();
    } else {
      throw Exception('Failed to fetch jokes');
    }
  }

  Future<void> cacheJokes(List<Joke> jokes) => _cacheHelper.saveJokesToCache(jokes);

  Future<List<Joke>> getCachedJokes() => _cacheHelper.getCachedJokes();
}
