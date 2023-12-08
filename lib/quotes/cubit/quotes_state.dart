part of 'quotes_cubit.dart';

@freezed
sealed class QuotesState with _$QuotesState {
  const factory QuotesState() = _QuotesState;

  factory QuotesState.loading() => const QuotesLoading();
  factory QuotesState.error(Exception exception) {
    return QuotesError(exception: exception);
  }

  factory QuotesState.loaded(
    String? activity,
    String? name,
    String? tag,
  ) {
    return QuotesLoaded(
      content: activity ?? "",
      name: name ?? "No Name",
      tag: tag ?? "",
    );
  }
}

class QuotesLoading implements QuotesState {
  const QuotesLoading();
}

class QuotesError implements QuotesState {
  const QuotesError({required this.exception});

  final Exception exception;
}

class QuotesLoaded implements QuotesState {
  const QuotesLoaded({
    required this.content,
    required this.name,
    required this.tag,
  });

  final String content;
  final String name;
  final String tag;
}
