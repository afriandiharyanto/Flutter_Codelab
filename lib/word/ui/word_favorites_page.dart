import 'package:ait_training/word/cubit/word_cubit.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class WordFavoritesPage extends StatelessWidget {
  const WordFavoritesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WordCubit, WordState>(
      builder: (context, state) {
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
              widget = ListView(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: Text(
                      'You have ${state.favorites.length} saved idea(s)',
                    ),
                  ),
                  for (var index = 0; index < state.favorites.length; index++)
                    IdeaTile(
                      index,
                      state.favorites.elementAt(index),
                      false,
                      onClick: (selected) => print("Select tile $selected"),
                    ),
                ],
              );

              if (state.favorites.isEmpty) {
                widget = const Center(
                  child: Text("No Favorites Yet"),
                );
              }
            }
            break;
          case WordLoading():
          default:
            break;
        }

        return widget;
      },
    );
  }
}

class IdeaTile extends StatelessWidget {
  const IdeaTile(this._index, this._text, this._isTicked,
      {required this.onClick, super.key});

  final int _index;
  final String _text;
  final bool _isTicked;
  final void Function(int) onClick;
  final Color _tileColor = const Color(0x00F4EAE0);

  @override
  Widget build(BuildContext context) {
    Icon checkbox = const Icon(Icons.check_box_outline_blank);
    if (_isTicked) {
      checkbox = const Icon(Icons.check_box);
    }

    return ListTile(
      dense: true,
      leading: GestureDetector(
        onTap: () => onClick(_index),
        child: checkbox,
      ),
      title: Text(_text),
      tileColor: _index % 2 == 0 ? _tileColor.withOpacity(1.0) : Colors.white,
    );
  }
}
