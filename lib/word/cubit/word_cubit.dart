import 'package:ait_training/idea/repository/idea_repository.dart';
import 'package:ait_training/word/repository/word_database.dart';
import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:math' as math;

import '../../idea/repository/idea_response.dart';

part 'word_state.dart';
part 'word_cubit.freezed.dart';

class WordCubit extends Cubit<WordState> {
  WordCubit(this._repository, this._database) : super(const WordState()) {
    initiate();
  }

  final IdeaRepository _repository;
  final WordDatabase _database;

  final Set<String> _favorites = {};
  final Set<String> _done = {};
  String _word = "";
  Color _newColor = Color((math.Random().nextDouble() * 0xFFFFFF).toInt());

  void initiate() async {
    emit(WordState.loading());
    (await _database.intialize()).fold(
      (l) {
        emit(WordState.error(l));
        return;
      },
      (r) => null,
    );

    (await _database.loadAll()).fold(
      (l) {
        emit(WordState.error(l));
        return;
      },
      (r) => _favorites.addAll(r),
    );

    next();
  }

  void save(String newWord) {
    if (_favorites.contains(newWord)) {
      _favorites.remove(newWord);
    } else {
      _favorites.add(newWord);
      _database.save(newWord);
    }

    emit(WordState.loaded(
      idea: _word,
      favorites: _favorites,
      done: _done,
      color: _newColor,
    ));
  }

  void next() async {
    emit(WordState.loading());
    _newColor = Color((math.Random().nextDouble() * 0xFFFFFF).toInt());
    Either<Exception, Idea> result = await _repository.fetchIdea();
    result.fold(
      (l) {
        emit(WordState.error(l));
      },
      (r) {
        _word = r.activity ?? "";
        emit(WordState.loaded(
          idea: _word,
          favorites: _favorites,
          done: _done,
          color: _newColor,
        ));
      },
    );
  }

  void setDone(int index){

  }
}
