import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:movie_app/Features/Home/data/Repo/home_repo.dart';
import 'package:movie_app/Features/Home/data/models/books_models/books_models.dart';
import 'package:movie_app/core/errors/failures.dart';
import 'package:movie_app/core/utils/api_server.dart';

class HomeRepoImplement implements HomeRepo {
  final ApiService apiService;

  HomeRepoImplement(this.apiService);
  @override
  Future<Either<Failure, List<BooksModels>>> feachNewestBooks() async {
    try {
      var data = await apiService.get(
        endPoint:
            'volumes?Filtering=free-ebooks&Sorting=newest &q=computer science',
      );
      List<BooksModels> books = [];
      for (var item in data['items']) {
        books.add(BooksModels.fromJson(item));
      }
      return right(books);
    } catch (e) {
      if (e is DioError) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<BooksModels>>> feachFeacherBooks() async {
     try {
      var data = await apiService.get(
        endPoint:
            'volumes?Filtering=free-ebooks&q=subject:Programming',
      );
      List<BooksModels> books = [];
      for (var item in data['items']) {
        books.add(BooksModels.fromJson(item));
      }
      return right(books);
    } catch (e) {
      if (e is DioError) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
    
  }
  
  @override
  Future<Either<Failure, List<BooksModels>>> feachSimilarBooks({required String Category}) async{
    try {
      var data = await apiService.get(
        endPoint:
            'volumes?Filtering=free-ebooks&Sorting=relevance &q=subject:Programming',
      );
      List<BooksModels> books = [];
      for (var item in data['items']) {
        books.add(BooksModels.fromJson(item));
      }
      return right(books);
    } catch (e) {
      if (e is DioError) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }
  
  @override
  Future<Either<Failure, List<BooksModels>>> feachSearchBooks({required String Query}) async {
    try {
      var data = await apiService.get(
        endPoint:
            'volumes?q=$Query',
      );
      List<BooksModels> books = [];
      for (var item in data['items']) {
        books.add(BooksModels.fromJson(item));
      }
      return right(books);
    } catch (e) {
      if (e is DioError) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
    
  }
}
