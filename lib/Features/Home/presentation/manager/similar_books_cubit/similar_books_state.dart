part of 'similar_books_cubit.dart';

sealed class SimilarBooksState extends Equatable {
  const SimilarBooksState();

  @override
  List<Object> get props => [];
}

final class SimilarBooksInitial extends SimilarBooksState {}

final class SimilarBooksFailure extends SimilarBooksState {
  final String errorMasseg;

  const SimilarBooksFailure(this.errorMasseg);
}

final class SimilarBooksSuccess extends SimilarBooksState {
  final List<BooksModels> books;

 const SimilarBooksSuccess(this.books);
}

final class SimilarBooksLoadind extends SimilarBooksState {}
