import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/jokes_provider.dart';
import '../widgets/joke_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final jokes = Provider.of<JokesProvider>(context).jokes;

    return Scaffold(
      appBar: AppBar(title: const Text('Jokes')),
      body: ListView.builder(
        itemCount: jokes.length,
        itemBuilder: (context, index) {
          return JokeCard(joke: jokes[index]);
        },
      ),
    );
  }
}
