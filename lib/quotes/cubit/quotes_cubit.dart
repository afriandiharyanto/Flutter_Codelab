import 'package:ait_training/quotes/repository/quotes_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'quotes_state.dart';
part 'quotes_cubit.freezed.dart';

class QuotesCubit extends Cubit<QuotesState> {
  QuotesCubit(this._repository) : super(QuotesState.loading()) {
    fetchQuotes();
  }

  final QuotesRepository _repository;

  void fetchQuotes() async {
    emit(QuotesState.loading());
    var result = await _repository.fetchQuote();

    result.fold(
      (l) => emit(QuotesState.error(l)),
      (r) => emit(QuotesState.loaded(
        r.content,
        r.originator?.name,
        r.tags?.first,
      )),
    );
  }
}
