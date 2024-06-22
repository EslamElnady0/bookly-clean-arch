import 'package:bookly/features/home/presentation/views/book_details_view.dart';
import 'package:bookly/features/home/presentation/views/home_view.dart';
import 'package:bookly/features/search/presentation/views/search_view.dart';
import 'package:bookly/features/splash/presentation/views/splash_view.dart';
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
        builder: (context, state) => const HomeView(),
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
