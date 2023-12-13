import 'package:flutter/material.dart';

class MemePage extends StatelessWidget {
  const MemePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
        backgroundColor: Colors.cyan,
        title: const Text("Boring App"),
        centerTitle: true,
      ),
      body: const Placeholder(),
    );
  }
}
