import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'idea_state.dart';
part 'idea_cubit.freezed.dart';

class IdeaCubit extends Cubit<IdeaState> {
  IdeaCubit() : super(IdeaState.empty());
}
