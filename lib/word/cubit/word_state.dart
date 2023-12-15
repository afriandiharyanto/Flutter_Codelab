part of 'word_cubit.dart';

@freezed
sealed class WordState with _$WordState {
  const factory WordState() = _WordState;
  factory WordState.loading() {
    return const WordLoading();
  }

  factory WordState.error(Exception exception) {
    return WordError(exception: exception);
  }

  factory WordState.loaded({
    required String idea,
    required Set<String> favorites,
    required Set<String> done,
    required Color color,
  }) {
    return WordLoaded(
      idea: idea,
      favorites: favorites,
      done: done,
      color: color,
    );
  }
}

class WordLoading implements WordState {
  const WordLoading();
}

class WordError implements WordState {
  const WordError({required this.exception});

  final Exception exception;
}

class WordLoaded implements WordState {
  const WordLoaded({
    required this.idea,
    required this.favorites,
    required this.done,
    required this.color,
  });

  final String idea;
  final Set<String> favorites;
  final Set<String> done;
  final Color color;
}
