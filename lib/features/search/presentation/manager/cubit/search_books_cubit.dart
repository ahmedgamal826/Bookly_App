import 'package:bloc/bloc.dart';
import 'package:bookly_app/features/search/data/repo/search_repo_implementation.dart';
import 'package:bookly_app/features/search/presentation/manager/cubit/search_books_state.dart';

class SearchBooksCubit extends Cubit<SearchBooksState> {
  final SearchRepoImplementation searchRepo;

  SearchBooksCubit(this.searchRepo) : super(SearchBooksInitial());

  Future<void> searchBooks({required String search}) async {
    emit(SearchBooksLoading());

    var result = await searchRepo.fetchSearchResults(search: search);

    result.fold(
      (failure) => emit(SearchBooksFailure(failure.errorMessage)),
      (books) => emit(SearchBooksSuccess(books)),
    );
  }
}
