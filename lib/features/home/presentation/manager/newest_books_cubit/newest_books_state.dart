part of 'newest_books_cubit.dart';

abstract class NewestBooksState extends Equatable {
  const NewestBooksState();

  @override
  List<Object> get props => [];
}

class NewestBooksInitial extends NewestBooksState {}

class NewestBooksLoading extends NewestBooksState {} // Loading State

class NewestBooksFailure extends NewestBooksState {
  // Failure State
  final String errorMessage;

  const NewestBooksFailure(this.errorMessage);
}

class NewestBooksSuccess extends NewestBooksState {
  // Success State
  final List books;

  const NewestBooksSuccess(this.books);
}
