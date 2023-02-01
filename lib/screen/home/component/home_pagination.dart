import 'package:flutter/material.dart';
import 'package:moviedb_app/core/provider/movie_provider.dart';
import 'package:moviedb_app/core/theme/app_theme.dart';
import 'package:provider/provider.dart';

class home_pagination extends StatelessWidget {
  const home_pagination({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Consumer<MovieProvider>(
        builder: (context, movieProvider, child) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                onPressed: movieProvider.previousMoviePage,
                icon: const Icon(
                  Icons.arrow_back,
                  color: DbAppTheme.greyWhite,
                ),
              ),
              IconButton(
                onPressed: movieProvider.nextMoviePage,
                icon: const Icon(
                  Icons.arrow_forward,
                  color: DbAppTheme.greyWhite,
                ),
              )
            ],
          );
        },
      ),
    );
  }
}
