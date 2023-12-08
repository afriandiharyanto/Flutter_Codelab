import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;

import 'dart:convert';
import 'quotes_response.dart';

class QuotesRepository {
  final String _url = 'https://quotes15.p.rapidapi.com/quotes/random/';
  var header = <String, String>{};

  Future<Either<Exception, Quotes>> fetchQuote() async {
    header["X-RapidAPI-Key"] =
        "8b76751f25msh14ba69d4a11746bp16d24djsn1581f0c85c18";
    header["X-RapidAPI-Host"] = "quotes15.p.rapidapi.com";
    try {
      var url = Uri.parse(_url);
      var response = await http.get(url, headers: header);
      if (response.statusCode == 200) {
        Quotes quotes = Quotes.fromJson(json.decode(response.body));
        return Right(quotes);
      } else {
        return Left(Exception());
      }
    } on http.ClientException catch (e) {
      return Left(e);
    }
  }
}
