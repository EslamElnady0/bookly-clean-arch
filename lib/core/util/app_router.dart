import 'package:bookly/core/DI/service_locator.dart';
import 'package:bookly/features/home/domain/use_cases/fetch_featured_books_use_case.dart';
import 'package:bookly/features/home/domain/use_cases/fetch_newest_books_use_case.dart';
import 'package:bookly/features/home/presentation/manager/cubit/newest_books_cubit.dart';
import 'package:bookly/features/home/presentation/manager/featured%20box%20cubit/featured_books_cubit.dart';
import 'package:bookly/features/home/presentation/views/book_details_view.dart';
import 'package:bookly/features/home/presentation/views/home_view.dart';
import 'package:bookly/features/search/presentation/views/search_view.dart';
import 'package:bookly/features/splash/presentation/views/splash_view.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

abstract class AppRouter {
  static const String splash = '/';
  static const String home = '/home';
  static const String bookDetails = '/bookDetails';
  static const String search = '/search';

  // GoRouter configuration
  static GoRouter router = GoRouter(
    routes: [
      GoRoute(
        path: splash,
        builder: (context, state) => const SplashView(),
      ),
      GoRoute(
        path: home,
        builder: (context, state) => MultiBlocProvider(providers: [
          BlocProvider(
            create: (context) =>
                FeaturedBooksCubit(getIt.get<FetchFeaturedBooksUseCase>())
                  ..fetchFeaturedBooks(),
          ),
          BlocProvider(
            create: (context) =>
                NewestBooksCubit(getIt.get<FetchNewestBooksUseCase>())
                  ..fetchNewestBooks(),
          )
        ], child: const HomeView()),
      ),
      GoRoute(
        path: bookDetails,
        builder: (context, state) => const BookDetailsView(),
      ),
      GoRoute(
        path: search,
        builder: (context, state) => const SearchView(),
      ),
    ],
  );
}
