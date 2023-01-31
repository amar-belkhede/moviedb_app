import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:moviedb_app/core/provider/movie_provider.dart';
import 'package:moviedb_app/core/theme/app_theme.dart';
import 'package:moviedb_app/screen/home/component/home_message.dart';
import 'package:moviedb_app/screen/home/component/moviecard/movie_card.dart';
import 'package:moviedb_app/screen/common/moviedb_app_bar.dart';
import 'package:moviedb_app/screen/home/component/search_bar.dart';
import 'package:provider/provider.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  static const String name = 'home';
  static const String path = '/';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey();

  @override
  void initState() {
    Future.delayed(Duration(seconds: 2))
        .then((value) => {FlutterNativeSplash.remove()});
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<MovieProvider>(context, listen: false);
    provider.getMovie(query: "spider", page: 1);

    return Scaffold(
      appBar: moviedbAppBar(),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            SearchBar(formKey: _formKey),
            Consumer<MovieProvider>(builder: (context, movieProvider, child) {
              if (movieProvider.loading) {
                return Expanded(
                  child: home_message(
                    message: 'Loading...',
                    loading: true,
                  ),
                );
              }

              if (movieProvider.getMovieList.isEmpty) {
                return Expanded(
                  child: home_message(message: 'Empty'),
                );
              }

              return Expanded(
                child: Column(
                  children: [
                    Expanded(
                      child: GridView.builder(
                        gridDelegate:
                            const SliverGridDelegateWithMaxCrossAxisExtent(
                          maxCrossAxisExtent: 200,
                          childAspectRatio: 2 / 3,
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 10,
                        ),
                        itemCount: movieProvider.getMovieList.length,
                        itemBuilder: (BuildContext ctx, index) {
                          return MovieCard(
                            movie: movieProvider.getMovieList[index],
                          );
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconButton(
                            onPressed: provider.previousMoviePage,
                            icon: const Icon(
                              Icons.arrow_back,
                              color: DbAppTheme.greyWhite,
                            ),
                          ),
                          IconButton(
                            onPressed: provider.nextMoviePage,
                            icon: const Icon(
                              Icons.arrow_forward,
                              color: DbAppTheme.greyWhite,
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              );
            }),
          ],
        ),
      ),
    );
  }
}
