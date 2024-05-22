part of 'featured_books_cubit.dart';

abstract class FeaturedBooksStates extends Equatable {
  const FeaturedBooksStates();

  @override
  List<Object> get props => [];
}

class FeaturedBooksInitial extends FeaturedBooksStates {}

class FeaturedBooksLoading extends FeaturedBooksStates {} // Loading State

class FeaturedBooksFailure extends FeaturedBooksStates {
  // Failure State
  final String errorMessage;

  const FeaturedBooksFailure({required this.errorMessage});
}

class FeaturedBooksSuccess extends FeaturedBooksStates {
  // Success State
  final List<BookModel> books;

  const FeaturedBooksSuccess(this.books);
}
