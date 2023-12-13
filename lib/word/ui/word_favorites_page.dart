import 'package:ait_training/word/cubit/word_cubit.dart';
import 'package:ait_training/word/cubit/word_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WordFavoritesPage extends StatelessWidget {
  const WordFavoritesPage({super.key});

  @override
  Widget build(Object context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF245953),
        toolbarHeight: 0.0,
      ),
      body: BlocBuilder<WordPairCubit, WordState>(builder: (context, state) {
        if (state.favorites.isEmpty) {
          return const Center(
            child: Text("No Favorites Yet"),
          );
        }

        return ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(20),
              child: Text('You have '
                  '${state.favorites.length} favorites:'),
            ),
            for (var pair in state.favorites)
              ListTile(
                leading: const Icon(Icons.favorite),
                title: Text(pair.asLowerCase),
              ),
          ],
        );
      }),
    );
  }
}
