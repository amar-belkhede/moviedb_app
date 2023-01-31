import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:moviedb_app/core/model/movie.dart';
import 'package:moviedb_app/screen/detail/detail_screen.dart';
import 'package:moviedb_app/screen/home/component/moviecard/component/movie_card_image.dart';
import 'package:moviedb_app/screen/home/component/moviecard/component/movie_card_text.dart';

class MovieCard extends StatelessWidget {
  MovieCard({
    super.key,
    required this.movie,
  });
  Movie movie;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.push(DetailScreen.path, extra: movie);
      },
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
        ),
        child: Stack(
          children: [
            MovieCardImage(imageUrl: movie.posterPath),
            MovieCardText(title: movie.title),
          ],
        ),
      ),
    );
  }
}
