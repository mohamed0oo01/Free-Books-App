import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movie_app/Features/Home/data/Repo/home_repo.dart';
import 'package:movie_app/Features/Home/data/models/books_models/books_models.dart';

part 'similar_books_state.dart';

class SimilarBooksCubit extends Cubit<SimilarBooksState> {
  SimilarBooksCubit(this.homeRepo) : super(SimilarBooksInitial());
  final HomeRepo homeRepo;

  Future<void> feachSimilarBooks ({required String Category}) async {
    emit(SimilarBooksLoadind());
    var result = await homeRepo.feachSimilarBooks(Category: Category);
    result.fold(
      (failuer) {
        emit(SimilarBooksFailure(failuer.errorMassseg));
      },
      (books) {
        emit(SimilarBooksSuccess(books));
      },
    );
  }
}
