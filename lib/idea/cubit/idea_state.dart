part of 'idea_cubit.dart';

@freezed
class IdeaState with _$IdeaState {
  const factory IdeaState({
    required String activity,
    required int participant,
    required double price,
  }) = _IdeaState;

  factory IdeaState.empty() {
    return const IdeaState(activity: "", participant: 1, price: 0.0);
  }


}
