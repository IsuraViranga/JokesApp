import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/joke.dart';

class CacheHelper {
  static const String _cachedJokesKey = 'cached_jokes';

  Future<void> saveJokesToCache(List<Joke> jokes) async {
    final prefs = await SharedPreferences.getInstance();
    final jokesJson = jsonEncode(jokes.map((joke) => joke.toJson()).toList());
    await prefs.setString(_cachedJokesKey, jokesJson);
  }

  Future<List<Joke>> getCachedJokes() async {
    final prefs = await SharedPreferences.getInstance();
    final jokesJson = prefs.getString(_cachedJokesKey);
    if (jokesJson != null) {
      final List<dynamic> decodedJson = jsonDecode(jokesJson);
      return decodedJson.map((json) => Joke.fromJson(json)).toList();
    }
    return [];
  }
}
