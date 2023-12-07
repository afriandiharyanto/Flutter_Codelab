part of 'idea_cubit.dart';

@freezed
class IdeaState with _$IdeaState {
  const factory IdeaState({
    required String name,
    required int age,
    required double salary,
  }) = _IdeaState;

  factory IdeaState.empty() => const IdeaState(name: "", age: 0, salary: 0.0);
}
