import 'package:flutter/material.dart';

void main() {
  runApp(const Kaizen());
}

class Kaizen extends StatelessWidget {
  const Kaizen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Kaizen',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const Scaffold(
        body: Text("Kaizen"),
      ),
    );
  }
}
