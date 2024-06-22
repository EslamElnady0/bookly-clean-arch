import 'package:bookly/core/util/api_service.dart';
import 'package:bookly/features/home/data/data%20sources/home_local_data_source.dart';
import 'package:bookly/features/home/data/repos/home_repo_impl.dart';
import 'package:bookly/features/home/domain/use_cases/fetch_featured_books_use_case.dart';
import 'package:bookly/features/home/domain/use_cases/fetch_newest_books_use_case.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import '../../features/home/data/data sources/home_remote_data_source.dart';

GetIt getIt = GetIt.instance;

void setupServiceLocator() {
  getIt.registerSingleton<HomeRemoteDataSourceImpl>(
      HomeRemoteDataSourceImpl(ApiService(Dio())));
  getIt.registerSingleton<HomeRepoImpl>(HomeRepoImpl(
      homeRemoteDataSource: getIt.get<HomeRemoteDataSourceImpl>(),
      homeLocalDataSource: HomeLocalDataSourceImpl()));

  getIt.registerSingleton<FetchFeaturedBooksUseCase>(
      FetchFeaturedBooksUseCase(getIt.get<HomeRepoImpl>()));
  getIt.registerSingleton<FetchNewestBooksUseCase>(
      FetchNewestBooksUseCase(getIt.get<HomeRepoImpl>()));
}
