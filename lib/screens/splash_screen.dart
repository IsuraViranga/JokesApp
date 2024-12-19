import 'package:flutter/material.dart';
import 'loading_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Navigate to LoadingScreen after a delay
    Future.delayed(const Duration(seconds: 5), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const LoadingScreen()),
      );
    });

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFF00BCD4), // Cyan (Start color)
              Color(0xFF8E24AA), // Purple (End color)
            ],
            begin: Alignment.topLeft, // Gradient starts from top-left
            end: Alignment.bottomRight, // Gradient ends at bottom-right
          ),
        ),
        child: const Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.emoji_emotions, // A smiley face icon
                size: 80,
                color: Colors.white,
              ),
              SizedBox(height: 16), // Space between icon and text
              Text(
                'Jokes App',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 8), // Space between title and subtitle
              Text(
                'Get ready to laugh!',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.white70,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
