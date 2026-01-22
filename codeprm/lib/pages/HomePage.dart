import 'package:flutter/material.dart';

class ShoppingApp extends StatelessWidget {
  const ShoppingApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: "First App", home: Homepage());
  }
}

class Homepage extends StatelessWidget {
  Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.menu),
        title: Text("Home"),
        backgroundColor: Colors.blueAccent,
      ),
      body: const Center(child: Text("Hello World")),
    );
  }
}
