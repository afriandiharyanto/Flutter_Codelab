import 'package:ait_training/idea/repository/idea_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'idea_state.dart';
part 'idea_cubit.freezed.dart';

class IdeaCubit extends Cubit<IdeaState> {
  IdeaCubit({required this.repository}) : super(IdeaState.empty());

  IdeaRepository repository;

  void getRandomIdea() async {
    emit(state.copyWith(price: 1.0));
    var result = await repository.fetchIdea();

    result.fold(
        (error) => emit(state),
        (idea) => emit(state.copyWith(
            activity: idea.activity ?? "",
            participant: idea.participants ?? 0,
            price: idea.price ?? 0.0)));
  }

  void getIdeaByType(String type) async {
    var result = await repository.fetchIdea(type: type);
    result.fold((error) {
      emit(state);
    }, (idea) {
      emit(state.copyWith(
          activity: idea.activity ?? "",
          participant: idea.participants ?? 0,
          price: idea.price ?? 0.0));
    });
  }
}
