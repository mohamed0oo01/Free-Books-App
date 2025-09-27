import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movie_app/Features/Home/data/Repo/home_repo.dart';
import 'package:movie_app/Features/Home/data/models/books_models/books_models.dart';

part 'newest_books_state.dart';

class NewestBooksCubit extends Cubit<NewestBooksState> {
  NewestBooksCubit(this.homeRepo) : super(NewestBooksInitial());

  final HomeRepo homeRepo;

  Future<void> feachNewestBooks() async {
    emit(NewestBooksLoading());
    var result = await homeRepo.feachNewestBooks();
    result.fold(
      (failuer) {
        emit(NewestBooksFailuer(failuer.errorMassseg));
      },
      (books) {
        emit(NewestBooksSuccess(books));
      },
    );
  }
}
