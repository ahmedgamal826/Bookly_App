import 'package:bloc/bloc.dart';
import 'package:bookly_app/features/home/data/repos/home_repo.dart';
import 'package:equatable/equatable.dart';

part 'similar_books_state.dart';

class SimilarBooksCubit extends Cubit<SimilarBooksState> {
  SimilarBooksCubit(this.homeRepo) : super(SimilarBooksInitial());

  final HomeRepo homeRepo;

  Future<void> fetchSimilarBooks({required String category}) async {
    emit(SimilarBooksLoading());

    var result = await homeRepo.fetchSimilarBooks(category: category);

    result.fold((failure) {
      emit(
        SimilarBooksFailure(
          errorMessage: failure.errorMessage,
        ),
      ); // emit Failure State
    }, (books) {
      emit(SimilarBooksSuccess(books: books));
    });
  }
}
