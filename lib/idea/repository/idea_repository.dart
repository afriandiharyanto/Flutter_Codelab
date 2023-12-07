import 'dart:convert';

import 'package:ait_training/idea/repository/idea_response.dart';
import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;

class IdeaRepository {
  Future<Either<Exception, Idea>> fetchIdea({String? type}) async {
    try {
      final response = await http
          .get(Uri.parse('http://www.boredapi.com/api/activity/${type ?? ""}'));

      if (response.statusCode == 200) {
        var result = json.decode(response.body);
        Idea idea = Idea(
            activity: result['activity'] as String,
            accessibility: 1.0,
            price: 1.0,
            participants: 0,
            type: result['type'] as String);

        return Right(idea);
      } else {
        throw Left(Exception('Failed to load idea'));
      }
    } on http.ClientException catch (error) {
      return Left(error);
    }
  }
}
