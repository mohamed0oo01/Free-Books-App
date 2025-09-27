part of 'featured_books_cubit.dart';

sealed class FeaturedBooksState extends Equatable {
  const FeaturedBooksState();

  @override
  List<Object> get props => [];
}

final class FeaturedBooksInitial extends FeaturedBooksState {}

final class FeaturedBooksLoading extends FeaturedBooksState {}

final class FeaturedBooksFailuer extends FeaturedBooksState {
  final String errmasseg;

  const FeaturedBooksFailuer(this.errmasseg);
}

final class FeaturedBooksSuccess extends FeaturedBooksState {
  final List<BooksModels> books;
  const FeaturedBooksSuccess(this.books);
}
