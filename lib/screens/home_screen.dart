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
      appBar: AppBar(
        flexibleSpace: Container(
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
        ),
        title: const Text(
          'Jokes',
          style: TextStyle(
            color: Colors.white, // Title color
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.account_circle, size: 28),
            color: Colors.white, // Profile icon color
            onPressed: () {
              // Handle profile icon press
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text("Profile icon pressed!")),
              );
            },
          ),
        ],
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFFF8BBD0), // Light Pink (Start color)
              Color(0xFF8E24AA), // Purple (End color)
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Center(
          child: Container(
            margin: const EdgeInsets.all(16.0), // Outer margin for the container
            padding: const EdgeInsets.all(12.0), // Inner padding for the content
            decoration: BoxDecoration(
              color: Colors.white, // White background for the container
              borderRadius: BorderRadius.circular(12.0), // Rounded corners
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.2), // Shadow color
                  blurRadius: 8.0, // Blur radius
                  offset: const Offset(0, 4), // Offset for shadow
                ),
              ],
            ),
            child: ListView.builder(
              shrinkWrap: true,
              physics: const BouncingScrollPhysics(), // Smooth scrolling
              itemCount: jokes.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: JokeCard(joke: jokes[index]),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
