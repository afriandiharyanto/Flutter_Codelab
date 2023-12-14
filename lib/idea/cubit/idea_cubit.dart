import 'package:ait_training/idea/repository/idea_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'idea_state.dart';
part 'idea_cubit.freezed.dart';

class IdeaCubit extends Cubit<IdeaState> {
  IdeaCubit({required this.repository}) : super(IdeaState.loading()) {
    getRandomIdea();
  }

  IdeaRepository repository;

  void getRandomIdea() async {
    emit(IdeaState.loading());
    var result = await repository.fetchIdea();

    result.fold(
      (error) => emit(IdeaState.error(error)),
      (idea) => emit(
        IdeaState.loaded(
          idea.activity,
          idea.participants,
          idea.price,
        ),
      ),
    );
  }

  void getIdeaByType(String type) async {
    var result = await repository.fetchIdea(type: type);
    result.fold(
      (error) => emit(IdeaState.error(error)),
      (idea) => emit(
        IdeaState.loaded(
          idea.activity,
          idea.participants,
          idea.price,
        ),
      ),
    );
  }
}
