import 'package:ait_training/idea/word_card.dart';
import 'package:ait_training/idea/word_pair_cubit.dart';
import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
      home: BlocProvider(
        create: (_) => WordPairCubit(),
        child: const MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF245953),
        toolbarHeight: 0.0,
      ),
      body: BlocBuilder<WordPairCubit, WordPair>(builder: (context, wordPair) {
        return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('Random Idea'),
              WordCard(wordPair: wordPair),
              ElevatedButton(
                  onPressed: () {
                    context.read<WordPairCubit>().next();
                  },
                  child: const Text('Next'))
            ],
          ),
        );
      }),
    );
  }
}
