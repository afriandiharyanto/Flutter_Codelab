import 'package:ait_training/home_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Namer App',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepOrange),
      ),
      home: Scaffold(
          appBar: AppBar(
            backgroundColor: const Color(0xFF245953),
            toolbarHeight: 0.0,
          ),
          body: const HomePage()),
    );
  }
}
