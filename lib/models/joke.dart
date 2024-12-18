class Joke {
  final String setup;
  final String punchline;

  Joke({required this.setup, required this.punchline});

  // Convert JSON to Joke object
  factory Joke.fromJson(Map<String, dynamic> json) {
    return Joke(
      setup: json['setup'],
      punchline: json['punchline'],
    );
  }

  // Convert Joke object to JSON
  Map<String, dynamic> toJson() {
    return {
      'setup': setup,
      'punchline': punchline,
    };
  }
}
