import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:moviedb_app/core/model/movie.dart';

class MovieDetailInfo extends StatelessWidget {
  MovieDetailInfo({
    super.key,
    required this.movie,
  });

  Movie movie;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          movie.title,
          maxLines: 3,
          overflow: TextOverflow.fade,
          style: Theme.of(context)
              .textTheme
              .titleLarge
              ?.copyWith(color: Colors.white),
        ),
        SizedBox(height: 5),
        Text(
          movie.releaseDate.year.toString(),
          maxLines: 3,
          overflow: TextOverflow.fade,
          style: Theme.of(context)
              .textTheme
              .labelLarge
              ?.copyWith(color: Colors.grey),
        ),
        SizedBox(height: 10),
        RatingBarIndicator(
          rating: movie.voteAverage.toDouble() / 2,
          itemBuilder: (context, index) => Icon(
            Icons.star,
            color: Colors.amber,
          ),
          unratedColor: Colors.amber[50],
          itemCount: 5,
          itemSize: 20.0,
          direction: Axis.horizontal,
        ),
      ],
    );
  }
}
