import 'package:ait_training/idea/cubit/idea_cubit.dart';
import 'package:ait_training/idea/repository/idea_repository.dart';
import 'package:ait_training/word/cubit/word_cubit.dart';
import 'package:get_it/get_it.dart';

void setupIdeaInjection() {
  GetIt.I.registerFactory<IdeaRepository>(() => IdeaRepository());
  GetIt.I.registerFactory<IdeaCubit>(
      () => IdeaCubit(repository: GetIt.I<IdeaRepository>()));
}

void setupWordInjection() {
  GetIt.I.registerFactory<WordPairCubit>(() => WordPairCubit());
}

void setupAllInjection() {
  setupIdeaInjection();
  setupWordInjection();
}
