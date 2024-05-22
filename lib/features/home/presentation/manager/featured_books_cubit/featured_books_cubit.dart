import 'package:bloc/bloc.dart';
import 'package:bookly_app/features/home/data/models/book_model/book_model.dart';
import 'package:bookly_app/features/home/data/repos/home_repo.dart';
import 'package:equatable/equatable.dart';

part 'featured_books_state.dart';

class NewestBooksCubit extends Cubit<NewestBooksState> {
  NewestBooksCubit(this.homeRepo) : super(NewestBooksInitial());

  final HomeRepo homeRepo;

  Future<void> fetchFeaturedBooks() async {
    emit(NewestBooksLoading());

    var result = await homeRepo.fetchFeaturedBooks();

    result.fold((failure) {
      emit(NewestBooksFailure(
          errorMessage: failure.errorMessage)); // emit Failure State
    }, (books) {
      emit(NewestBooksSuccess(books));
    });
  }
}
