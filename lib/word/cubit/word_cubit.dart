import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'dart:math' as math;

import 'word_state.dart';

class WordPairCubit extends Cubit<WordState> {
  WordPairCubit() : super(WordState.empty());

  final Set<WordPair> _favorites = {};
  WordPair _pair = WordPair.random();
  void toggle(WordPair wordPair) {
    if (_favorites.contains(wordPair)) {
      _favorites.remove(wordPair);
    } else {
      _favorites.add(wordPair);
    }
    emit(state.copy(newFavorites: Set.of(_favorites)));
  }

  void next() {
    _pair = WordPair.random();
    Color newColor = Color((math.Random().nextDouble() * 0xFFFFFF).toInt());
    emit(state.copy(newPair: _pair, newColor: newColor));
  }
}
