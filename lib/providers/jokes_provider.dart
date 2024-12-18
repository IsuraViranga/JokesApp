import 'package:flutter/material.dart';
import '../models/joke.dart';
import '../services/jokes_service.dart';

class JokesProvider extends ChangeNotifier {
  final JokesService _jokesService = JokesService();

  List<Joke> _jokes = [];
  bool _isLoading = false;

  List<Joke> get jokes => _jokes;
  bool get isLoading => _isLoading;

  Future<void> loadJokes() async {
    _isLoading = true;
    notifyListeners();

    try {
      _jokes = await _jokesService.fetchJokes();
      await _jokesService.cacheJokes(_jokes);
    } catch (e) {
      _jokes = await _jokesService.getCachedJokes();
    }

    _isLoading = false;
    notifyListeners();
  }
}
