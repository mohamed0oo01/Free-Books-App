import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/Features/Home/data/Repo/home_repo_implement.dart';
import 'package:movie_app/Features/Home/presentation/manager/Newest_books_Cubit/newest_books_cubit.dart';
import 'package:movie_app/Features/Home/presentation/manager/featured_books_cubit/featured_books_cubit.dart';
import 'package:movie_app/Features/Home/presentation/manager/search_books_cubit/search_books_cubit.dart';
import 'package:movie_app/constant.dart';
import 'package:movie_app/core/utils/app_router.dart';
import 'package:movie_app/core/utils/serves_locator.dart';

void main() {
  setup();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              FeaturedBooksCubit(getIt.get<HomeRepoImplement>())
                ..feachFeacherBooks(),
        ),

        BlocProvider(
          create: (context) =>
              NewestBooksCubit(getIt.get<HomeRepoImplement>())
                ..feachNewestBooks(),
        ),
        BlocProvider(
          create: (context) => SearchBooksCubit(getIt.get<HomeRepoImplement>()),
        ),
      ],

      child: MaterialApp.router(
        routerConfig: AppRouter.router,
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: kprimarycolor,
        ),
      ),
    );
  }
}
