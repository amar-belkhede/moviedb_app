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
    Future<void> pagination({bool next = false, bool prev = false}) async {
      var provider = Provider.of<MovieProvider>(context, listen: false);
      if (next) {
        provider.nextMoviePage();
      } else if (prev) {
        provider.previousMoviePage();
      }
    }

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            onPressed: () => pagination(prev: true),
            icon: const Icon(
              Icons.arrow_back,
              color: DbAppTheme.greyWhite,
            ),
          ),
          IconButton(
            onPressed: () => pagination(next: true),
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
