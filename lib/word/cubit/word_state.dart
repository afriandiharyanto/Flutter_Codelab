import 'package:english_words/english_words.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

class WordState extends Equatable {
  const WordState(
      {required this.wordPair, required this.favorites, required this.color});

  final WordPair wordPair;
  final Set<WordPair> favorites;
  final Color color;

  @override
  List<Object?> get props => [wordPair, favorites];

  factory WordState.empty() {
    return WordState(
        wordPair: WordPair.random(),
        favorites: const {},
        color: Color((math.Random().nextDouble() * 0xFFFFFF).toInt()));
  }

  WordState copy(
      {WordPair? newPair, Set<WordPair>? newFavorites, Color? newColor}) {
    return WordState(
        wordPair: newPair ?? wordPair,
        favorites: newFavorites ?? favorites,
        color: newColor ?? color);
  }
}
