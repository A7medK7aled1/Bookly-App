import 'package:bookly_app/core/utils/api_serves.dart';
import 'package:bookly_app/features/home/data/repos/home_repo_impl.dart';
import 'package:bookly_app/features/search/data/repos/search_repo.dart';
import 'package:bookly_app/features/search/data/repos/search_repo_impl.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setup() {
  getIt.registerSingleton<ApiServes>(ApiServes(dio: Dio()));
  getIt.registerSingleton<HomeRepoImpl>(
      HomeRepoImpl(apiServes: getIt.get<ApiServes>()));
  getIt.registerSingleton<SearchRepo>(
    SearchRepoImpl(
      getIt.get<ApiServes>(),
    ),
  );
}
