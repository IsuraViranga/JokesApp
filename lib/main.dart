import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'providers/jokes_provider.dart';
import 'screens/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => JokesProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Jokes App',
        theme: ThemeData(primarySwatch: Colors.blue),
        home: const SplashScreen(),
      ),
    );
  }
}






