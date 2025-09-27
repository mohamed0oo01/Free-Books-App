import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:movie_app/Features/Home/data/Repo/home_repo_implement.dart';
import 'package:movie_app/Features/Home/data/models/books_models/books_models.dart';
import 'package:movie_app/Features/Home/presentation/manager/similar_books_cubit/similar_books_cubit.dart';
import 'package:movie_app/Features/Home/presentation/views/Home_view.dart';
import 'package:movie_app/Features/Home/presentation/views/book_detail_view.dart';
import 'package:movie_app/Features/search/peresentaion/views/search_view_.dart';
import 'package:movie_app/Features/splash/presentaion/views/splash_view.dart';
import 'package:movie_app/core/utils/serves_locator.dart';

abstract class AppRouter {
  static const KHomeView = '/HomeView';
  static const KbookDetailsView = '/BookDetailsView';
  static const KSearchView = '/SearchView';

  static final GoRouter router = GoRouter(
    routes: [
      GoRoute(path: '/', builder: (context, state) => const SplashView()),
      GoRoute(path: KHomeView, builder: (context, state) => const HomeView()),
      GoRoute(
        path: KbookDetailsView,
        builder: (context, state) => BlocProvider(
          create: (context) => SimilarBooksCubit(getIt.get<HomeRepoImplement>()),
          child:  BookDetailsView(bookModel: state.extra as BooksModels,),
        ),
      ),
      GoRoute(
        path: KSearchView,
        builder: (context, state) => const SearchView(),
      ),
    ],
  );
}
