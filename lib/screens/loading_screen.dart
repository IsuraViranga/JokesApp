import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'home_screen.dart';
import '../providers/jokes_provider.dart';

class LoadingScreen extends StatelessWidget {
  const LoadingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Trigger jokes loading
    Provider.of<JokesProvider>(context, listen: false).loadJokes();

    return Scaffold(
      body: Consumer<JokesProvider>(
        builder: (context, provider, child) {
          if (provider.isLoading) {
            return Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color(0xFF00BCD4), // Cyan (Start color)
                    Color(0xFF8E24AA), // Purple (End color)
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Icon for loading
                    const Icon(
                      Icons.emoji_emotions, // Fun emoji icon
                      size: 100,
                      color: Colors.white,
                    ),
                    const SizedBox(height: 24),
                    const Text(
                      'Loading jokes...',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 16),
                    // Custom loading indicator
                    const CircularProgressIndicator(
                      color: Colors.white,
                      strokeWidth: 4,
                    ),
                  ],
                ),
              ),
            );
          } else {
            return const HomeScreen();
          }
        },
      ),
    );
  }
}
