import 'package:english_words/english_words.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WordPairCubit extends Cubit<WordPair> {
  WordPairCubit() : super(WordPair.random());

  void next() => emit(WordPair.random());
}
