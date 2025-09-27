import 'package:dartz/dartz.dart';
import 'package:movie_app/Features/Home/data/models/books_models/books_models.dart';
import 'package:movie_app/core/errors/failures.dart';

abstract class HomeRepo {
  Future<Either<Failure,List<BooksModels>>>feachNewestBooks();
  Future<Either<Failure,List<BooksModels>>>feachFeacherBooks();
  Future<Either<Failure,List<BooksModels>>>feachSimilarBooks({required  String Category});
  Future<Either<Failure,List<BooksModels>>>feachSearchBooks({required  String Query});
}
