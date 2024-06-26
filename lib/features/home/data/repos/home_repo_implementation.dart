import 'package:bookly_app/core/errors/failures.dart';
import 'package:bookly_app/core/models/book_model/book_model.dart';
import 'package:bookly_app/core/utils/api_service.dart';
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
      Map data = await apiService.get(
          endPoint:
              'volumes?Filtering=paid-ebooks&Sorting=newest&q=artificial intelligence');

      List<BookModel> books = [];

      for (var item in data['items']) {
        books.add(BookModel.fromJson(item));
      }
      return right(books);
    } on DioException catch (e) {
      if (e == DioError) {
        return left(
          ServerFailure.fromDioError(e),
        );
      }
      return left(ServerFailure(e.toString()));
    }
  }

  // fetchFeaturedBooks method
  @override
  Future<Either<Failure, List<BookModel>>> fetchFeaturedBooks() async {
    try {
      Map data = await apiService.get(
          endPoint:
              'volumes?Filtering=free-ebooks&q=subject:Python programming language');

      List<BookModel> books = [];

      for (var item in data['items']) {
        try {
          books.add(BookModel.fromJson(item));
        } catch (e) {
          print(item);
        }
      }
      return right(books);
    } on DioException catch (e) {
      if (e == DioError) {
        return left(
          ServerFailure.fromDioError(e),
        );
      }
      return left(ServerFailure(e.toString()));
    }
  }

  // fetchSimilarBooks method
  @override
  Future<Either<Failure, List<BookModel>>> fetchSimilarBooks(
      {required String category}) async {
    try {
      // Determine the endpoint based on the category
      String endPoint;
      if (category.isNotEmpty) {
        endPoint = 'volumes?Filtering=free-ebooks&q=subject:$category';
      } else {
        endPoint =
            'volumes?Filtering=paid-ebooks&Sorting=newest&q=artificial intelligence';
      }

      Map data = await apiService.get(endPoint: endPoint);

      List<BookModel> books = [];

      for (var item in data['items']) {
        books.add(BookModel.fromJson(item));
      }
      return right(books);
    } on DioException catch (e) {
      if (e == DioError) {
        return left(
          ServerFailure.fromDioError(e),
        );
      }
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<BookModel>>> searchBooks(String query) async {
    try {
      Map data = await apiService.get(endPoint: 'volumes?q=$query');

      List<BookModel> books = (data['items'] as List)
          .map((item) => BookModel.fromJson(item))
          .toList();
      return right(books);
    } on DioException catch (e) {
      return left(ServerFailure.fromDioError(e));
    }
  }
}
