import 'package:ait_training/idea/cubit/idea_cubit.dart';
import 'package:ait_training/idea/repository/idea_repository.dart';
import 'package:ait_training/quotes/cubit/quotes_cubit.dart';
import 'package:ait_training/quotes/repository/quotes_repository.dart';
import 'package:ait_training/word/cubit/word_cubit.dart';
import 'package:ait_training/word/repository/word_database.dart';
import 'package:get_it/get_it.dart';

void setupIdeaInjection() {
  GetIt.I.registerFactory<IdeaRepository>(() => IdeaRepository());
  GetIt.I.registerFactory<IdeaCubit>(
    () => IdeaCubit(
      repository: GetIt.I<IdeaRepository>(),
    ),
  );
}

void setupWordInjection() {
  GetIt.I.registerFactory<WordDatabase>(() => WordDatabase());
  GetIt.I.registerFactory<WordCubit>(
    () => WordCubit(
      GetIt.I<IdeaRepository>(),
      GetIt.I<WordDatabase>(),
    ),
  );
}

void setupQuotesInjection() {
  GetIt.I.registerFactory<QuotesRepository>(() => QuotesRepository());
  GetIt.I.registerFactory<QuotesCubit>(
    () => QuotesCubit(
      GetIt.I<QuotesRepository>(),
    ),
  );
}

void setupAllInjection() {
  setupIdeaInjection();
  setupWordInjection();
  setupQuotesInjection();
}
