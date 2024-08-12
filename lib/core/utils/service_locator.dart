import 'package:bookly/core/utils/api.dart';
import 'package:bookly/features/home/data/repos/home_repo_imp.dart';
import 'package:bookly/features/search/data/repo/home_repo_imp.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setupServiceLocator() {
  getIt.registerSingleton<ApiService>(
    ApiService(
      Dio(),
    ),
  );

  getIt.registerSingleton<HomeRepoImp>(
    HomeRepoImp(
      apiService: getIt<ApiService>(),
    ),
  );

  getIt.registerSingleton<SearchRepoImp>(
    SearchRepoImp(
      apiService: getIt<ApiService>(),
    ),
  );

}
