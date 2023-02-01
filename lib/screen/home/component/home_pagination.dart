
import 'package:flutter/material.dart';
import 'package:moviedb_app/core/provider/movie_provider.dart';
import 'package:moviedb_app/core/theme/app_theme.dart';

class home_pagination extends StatelessWidget {
 home_pagination({
    super.key,
    required this.provider,
  });
  MovieProvider provider;

  @override
  Widget build(BuildContext context) {
    return Padding(
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
    );
  }
}
