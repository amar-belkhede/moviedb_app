import 'package:flutter/material.dart';
import 'package:moviedb_app/core/provider/movie_provider.dart';
import 'package:moviedb_app/core/theme/app_theme.dart';
import 'package:moviedb_app/router.dart';
import 'package:provider/provider.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

void main() {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => MovieProvider(),
      child: MaterialApp.router(
        title: 'MovieDB',
        debugShowCheckedModeBanner: false,
        routerDelegate: moviedbRouterConfig.routerDelegate,
        routeInformationParser: moviedbRouterConfig.routeInformationParser,
        theme: ThemeData(
            primarySwatch: DbAppTheme.moviedb_color,
            scaffoldBackgroundColor: Colors.black),
      ),
    );
  }
}
