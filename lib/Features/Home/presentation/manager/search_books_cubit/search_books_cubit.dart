import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movie_app/Features/Home/data/Repo/home_repo.dart';
import 'package:movie_app/Features/Home/data/models/books_models/books_models.dart';

part 'search_books_state.dart';

class SearchBooksCubit extends Cubit<SearchBooksState> {
  SearchBooksCubit(this.homeRepo) : super(SearchBooksInitial());
  final HomeRepo homeRepo;

  Future<void> feachSearchBooks({required String Query}) async {
    emit(SearchBooksLoading());
    var result = await homeRepo.feachSearchBooks(Query: Query);
    result.fold(
      (failuer) {
        emit(SearchBooksFailuer(failuer.errorMassseg));
      },
      (books) {
        emit(SearchBooksSuccess(books));
      },
    );
  }
}
