import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import 'quotes_response.dart';

class QuotesRepository {
  QuotesRepository() {
    _header["X-RapidAPI-Key"] =
        "8b76751f25msh14ba69d4a11746bp16d24djsn1581f0c85c18";
    _header["X-RapidAPI-Host"] = "quotes15.p.rapidapi.com";
  }

  final String _url = 'https://quotes15.p.rapidapi.com/quotes/random/';
  final _header = <String, String>{};
  final _dio = Dio();

  Future<Either<Exception, Quotes>> fetchQuote() async {
    try {
      _dio.options.headers.addAll(_header);
      var response = await _dio.get(_url);
      if (response.statusCode == 200) {
        Quotes quotes = Quotes.fromJson(response.data);
        return Right(quotes);
      } else {
        return Left(Exception());
      }
    } on Exception catch (e) {
      return Left(e);
    }
  }
}
