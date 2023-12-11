import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'meme_state.dart';
part 'meme_cubit.freezed.dart';

class MemeCubit extends Cubit<MemeState> {
  MemeCubit() : super(MemeState.initial());
}
