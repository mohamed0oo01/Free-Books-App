part of 'search_books_cubit.dart';

sealed class SearchBooksState extends Equatable {
  const SearchBooksState();

  @override
  List<Object> get props => [];
}

final class SearchBooksInitial extends SearchBooksState {}

final class SearchBooksLoading extends SearchBooksState {}

final class SearchBooksSuccess extends SearchBooksState {
  final List<BooksModels> books;

  const SearchBooksSuccess(this.books);
}

final class SearchBooksFailuer extends SearchBooksState {
  final String errmasseg;

  const SearchBooksFailuer(this.errmasseg);
}
