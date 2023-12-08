part of 'idea_cubit.dart';

@freezed
sealed class IdeaState with _$IdeaState {
  const factory IdeaState() = _IdeaState;

  factory IdeaState.loading() {
    return const IdeaLoading();
  }

  factory IdeaState.error(Exception exception) {
    return IdeaError(exception: exception);
  }

  factory IdeaState.loaded(
    String? activity,
    int? participant,
    double? price,
  ) {
    return IdeaLoaded(
      activity: activity ?? "",
      participant: participant ?? 0,
      price: price ?? 0.0,
    );
  }
}

class IdeaLoading implements IdeaState {
  const IdeaLoading();
}

class IdeaError implements IdeaState {
  const IdeaError({required Exception exception});
}

class IdeaLoaded implements IdeaState {
  const IdeaLoaded({
    required this.activity,
    required this.participant,
    required this.price,
  });

  final String activity;
  final int participant;
  final double price;
}
