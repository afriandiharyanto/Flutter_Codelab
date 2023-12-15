import 'package:ait_training/common/widgets/card_widget.dart';
import 'package:ait_training/word/cubit/word_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class WordGeneratorPage extends StatelessWidget {
  const WordGeneratorPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF245953),
        toolbarHeight: 0.0,
      ),
      body: BlocBuilder<WordCubit, WordState>(
        builder: (context, state) {
          WordCubit cubit = context.read<WordCubit>();
          Widget widget = Center(
            child: LoadingAnimationWidget.staggeredDotsWave(
              color: Colors.black45,
              size: 42,
            ),
          );

          switch (state) {
            case WordError():
              {
                widget = Center(
                  child: Text(state.exception.toString()),
                );
              }
              break;
            case WordLoaded():
              {
                IconData icon = Icons.favorite_border;
                if (state.favorites.contains(state.idea)) {
                  icon = Icons.favorite;
                }
                widget = Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CardWidget(
                        mainWord: state.idea,
                        bgColor: state.color,
                        fontSize: 42.0,
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          ElevatedButton.icon(
                            onPressed: () {
                              cubit.save(state.idea);
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
                                  color: Colors.black.withOpacity(0.9),
                                  fontSize: 14.0),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                );
              }
              break;
            case WordLoading():
            default:
              break;
          }

          return widget;
        },
      ),
    );
  }
}
