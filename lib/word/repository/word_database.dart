import 'package:dartz/dartz.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class WordDatabase {
  WordDatabase();

  final String _dbName = 'idea_database.db';
  final String _favorite = 'favorite';
  final String _done = 'done';
  final String _itemColumn = 'item';
  late Database _database;

  Future<Either<Exception, void>> intialize() async {
    try {
      _database = await openDatabase(
        join(await getDatabasesPath(), _dbName),
        onCreate: (db, version) {
          return createTable(db);
        },
        version: 1,
      );

      return const Right(null);
    } on DatabaseException catch (e) {
      return Left(e);
    } catch (e) {
      return Left(Exception(e));
    }
  }

  void createTable(Database database) {
    database.execute(
      'CREATE TABLE $_favorite(id INTEGER PRIMARY KEY, $_itemColumn TEXT NOT NULL)',
    );

    database.execute(
      'CREATE TABLE $_done(id INTEGER PRIMARY KEY, $_itemColumn TEXT NOT NULL)',
    );
  }

  Future<Either<Exception, List<String>>> loadAll() async {
    try {
      List<Map<String, dynamic>> maps = await _database.query(_favorite);
      List<String> data = List<String>.generate(
        maps.length,
        (i) => maps[i][_itemColumn],
      );

      return Right(data);
    } on DatabaseException catch (e) {
      return Left(e);
    } catch (e) {
      return Left(Exception(e));
    }
  }

  Future<Either<Exception, void>> save(String newWord) async {
    Map<String, String> data = <String, String>{_itemColumn: newWord};

    try {
      _database.insert(
        _favorite,
        data,
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
      return const Right(null);
    } on DatabaseException catch (e) {
      return Left(e);
    } on Exception catch (e) {
      return Left(e);
    }
  }

  Future<Either<Exception, void>> update(String newWord) async {
    Map<String, String> data = <String, String>{_itemColumn: newWord};

    try {
      _database.update(
        _favorite,
        data,
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
      return const Right(null);
    } on DatabaseException catch (e) {
      return Left(e);
    } on Exception catch (e) {
      return Left(e);
    }
  }

  Future<Either<Exception, void>> setDone(String newWord) async {
    Map<String, String> data = <String, String>{_itemColumn: newWord};

    try {
      _database.insert(
        _favorite,
        data,
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
      return const Right(null);
    } on DatabaseException catch (e) {
      return Left(e);
    } on Exception catch (e) {
      return Left(e);
    }
  }
}
