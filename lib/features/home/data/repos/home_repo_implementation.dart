import 'package:bookly_app/core/errors/failures.dart';
import 'package:bookly_app/core/utils/api_service.dart';
import 'package:bookly_app/features/home/data/models/book_model/book_model.dart';
import 'package:bookly_app/features/home/data/repos/home_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class HomeRepoImplementations implements HomeRepo {
  final ApiService apiService;

  HomeRepoImplementations(this.apiService);

  // fetchNewestBooks method
  @override
  Future<Either<Failure, List<BookModel>>> fetchNewestBooks() async {
    try {
      //var data
      Map data = await apiService.get(
          endPoint:
              'volumes?Filtering=paid-ebooks&Sorting=newest &q=artifical intelligence');

      List<BookModel> books = [];

      for (var item in data['items']) {
        books.add(BookModel.fromJson(item));
      }
      return right(books); // as Either<Failure, List<BookModel>>
    } on DioException catch (e) {
      // ignore: deprecated_member_use, unrelated_type_equality_checks
      if (e == DioError) {
        return left(
          ServerFailure.fromDioError(e), // Dio Exception
        );
      }
      return left(
          ServerFailure(e.toString())); // any exception except dio exception
    }
  }

  // fetchFeaturedBooks method  ==> show all books
  @override
  Future<Either<Failure, List<BookModel>>> fetchFeaturedBooks() async {
    try {
      //var data
      Map data = await apiService.get(
          endPoint:
              'volumes?Filtering=free-ebooks&q=subject:Python programming language');

      List<BookModel> books = [];

      for (var item in data['items']) {
        books.add(BookModel.fromJson(item));
      }
      return right(books); // as Either<Failure, List<BookModel>>
    } on DioException catch (e) {
      // ignore: deprecated_member_use, unrelated_type_equality_checks
      if (e == DioError) {
        return left(
          ServerFailure.fromDioError(e), // Dio Exception
        );
      }
      return Left(
          ServerFailure(e.toString())); // any exception except dio exception
    }
  }

  // fetchSimilarBooks method  ==> show all books
  @override
  Future<Either<Failure, List<BookModel>>> fetchSimilarBooks(
      {required String category}) async {
    try {
      //var data
      Map data = await apiService.get(
          endPoint:
              'volumes?Filtering=free-ebooks&q=subject:Python programming language');

      List<BookModel> books = [];

      for (var item in data['items']) {
        books.add(BookModel.fromJson(item));
      }
      return right(books); // as Either<Failure, List<BookModel>>
    } on DioException catch (e) {
      // ignore: deprecated_member_use, unrelated_type_equality_checks
      if (e == DioError) {
        return left(
          ServerFailure.fromDioError(e), // Dio Exception
        );
      }
      return Left(
          ServerFailure(e.toString())); // any exception except dio exception
    }
  }
}
