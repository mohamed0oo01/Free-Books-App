import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movie_app/Features/Home/data/Repo/home_repo.dart';
import 'package:movie_app/Features/Home/data/models/books_models/books_models.dart';

part 'featured_books_state.dart';

class FeaturedBooksCubit extends Cubit<FeaturedBooksState> {
  FeaturedBooksCubit(this.homeRepo) : super(FeaturedBooksInitial());

  final HomeRepo homeRepo;

  Future<void> feachFeacherBooks() async {
    emit(FeaturedBooksLoading());
    var result = await homeRepo.feachFeacherBooks();
    result.fold(
      (failuer) {
        emit(FeaturedBooksFailuer(failuer.errorMassseg));
      },
      (books) {
        emit(FeaturedBooksSuccess(books));
      },
    );
  }
}
