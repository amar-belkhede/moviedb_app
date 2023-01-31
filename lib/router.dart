import 'package:go_router/go_router.dart';
import 'package:moviedb_app/core/model/movie.dart';
import 'package:moviedb_app/screen/detail/detail_screen.dart';
import 'package:moviedb_app/screen/home/home_screen.dart';

final GoRouter moviedbRouterConfig = GoRouter(
  routes: [
    GoRoute(
      name: HomeScreen.name,
      path: HomeScreen.path,
      builder: (context, state) => const HomeScreen(),
    ),
    GoRoute(
      name: DetailScreen.name,
      path: DetailScreen.path,
      // builder: (context, state) => DetailScreen(),
      builder: (context, state) {
      Movie movie = state.extra as Movie; // 👈 casting is important
      return DetailScreen(movie: movie);
    },

    ),
  ],
);
