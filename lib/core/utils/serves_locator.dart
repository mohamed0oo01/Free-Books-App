import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:movie_app/Features/Home/data/Repo/home_repo_implement.dart';
import 'package:movie_app/Features/Home/presentation/manager/featured_books_cubit/featured_books_cubit.dart';
import 'package:movie_app/core/utils/api_server.dart';

final getIt = GetIt.instance;

void setup() {
  getIt.registerSingleton<ApiService>(ApiService(Dio()));
  getIt.registerSingleton<HomeRepoImplement>(
    HomeRepoImplement(getIt.get<ApiService>()),
  );
  getIt.registerSingleton<FeaturedBooksCubit>(
    FeaturedBooksCubit(getIt.get<HomeRepoImplement>()),
    
  );
  
}
