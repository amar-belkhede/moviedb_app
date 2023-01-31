import 'package:flutter/material.dart';
import 'package:moviedb_app/core/model/movie.dart';
import 'package:moviedb_app/screen/detail/component/movie_detail_info.dart';
import 'package:moviedb_app/screen/home/component/moviecard/component/movie_card_image.dart';

class MovieDetailCard extends StatelessWidget {
  MovieDetailCard({
    super.key,
    required this.movie,
  });

  Movie movie;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 200,
          width: 140,
          margin: const EdgeInsets.only(left: 20, right: 20),
          child: MovieCardImage(imageUrl: movie.posterPath),
        ),
        Container(
          height: 200,
          width: MediaQuery.of(context).size.width - 180,
          child: MovieDetailInfo(movie: movie),
        ),
      ],
    );
  }
}
