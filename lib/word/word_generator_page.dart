import 'package:ait_training/word/word_card.dart';
import 'package:ait_training/word/word_cubit.dart';
import 'package:ait_training/word/word_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WordGeneratorPage extends StatelessWidget {
  const WordGeneratorPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WordPairCubit, WordState>(builder: (context, state) {
      WordPairCubit cubit = context.read<WordPairCubit>();
      IconData icon;
      if (state.favorites.contains(state.wordPair)) {
        icon = Icons.favorite;
      } else {
        icon = Icons.favorite_border;
      }

      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            WordCard(
              wordPair: state.wordPair,
              bgColor: state.color,
            ),
            const SizedBox(
              height: 20.0,
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                ElevatedButton.icon(
                  onPressed: () {
                    cubit.toggle(state.wordPair);
                  },
                  icon: Icon(icon),
                  label: const Text('Like'),
                ),
                const SizedBox(
                  width: 20.0,
                ),
                ElevatedButton(
                    onPressed: () {
                      cubit.next();
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.amberAccent,
                    ),
                    child: Text(
                      'Next',
                      style: TextStyle(
                          color: Colors.black.withOpacity(0.9), fontSize: 14.0),
                    )),
              ],
            )
          ],
        ),
      );
    });
  }
}
