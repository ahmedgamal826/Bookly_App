import 'package:bookly_app/core/errors/failures.dart';
import 'package:bookly_app/core/utils/api_service.dart';
import 'package:bookly_app/features/home/data/models/book_model/book_model.dart';
import 'package:bookly_app/features/search/data/repo/search_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class SearchRepoImplementation implements SearchRepo {
  final ApiService apiService;

  SearchRepoImplementation(this.apiService);
  @override
  Future<Either<Failure, List<BookModel>>> fetchSearchResults(
      {required String search}) async {
    try {
      var data = await apiService.get(

          // https://www.googleapis.com/books/v1/volumes?Filtering=free-ebooks&q=intitle:programming
          // endPoint:
          //     'volumes?Filtering=free-ebooks&Sorting=relevance& q=intitle:$search');

          endPoint: 'volumes?Filtering=free-ebooks&q=intitle:$search');
      List<BookModel> books = [];

      for (var item in data['items']) {
        books.add(BookModel.fromJson(item));
      }

      return right(books);
    } catch (error) {
      if (error is DioException) {
        return left(ServerFailure.fromDioError(error));
      } else {
        return left(
          ServerFailure('This category is not found '),
        );
      }
    }
  }
}
