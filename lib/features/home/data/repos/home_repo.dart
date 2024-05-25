import 'package:bookly_app/core/errors/failures.dart';
import 'package:bookly_app/core/utils/api_service.dart';
import 'package:bookly_app/features/home/data/models/book_model/book_model.dart';
import 'package:dartz/dartz.dart';

abstract class HomeRepo {
  HomeRepo(ApiService apiService);

  Future<Either<Failure, List<BookModel>>> fetchNewestBooks();
  Future<Either<Failure, List<BookModel>>> fetchFeaturedBooks();

  Future<Either<Failure, List<BookModel>>> fetchSimilarBooks(
      {required String category});

  Future<Either<Failure, List<BookModel>>> searchBooks(String query);
}
