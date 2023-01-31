import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:moviedb_app/core/model/movie.dart';
import 'package:moviedb_app/core/theme/app_theme.dart';
import 'package:moviedb_app/screen/common/moviedb_app_bar.dart';
import 'package:moviedb_app/screen/detail/component/movie_detail_card.dart';
import 'package:moviedb_app/screen/detail/component/movie_detail_info.dart';
import 'package:moviedb_app/screen/detail/component/movie_detail_poster.dart';
import 'package:moviedb_app/screen/detail/component/movie_detail_synopsis.dart';
import 'package:moviedb_app/screen/home/component/moviecard/component/movie_card_image.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class DetailScreen extends StatefulWidget {
  DetailScreen({super.key, required this.movie});

  static const String name = 'detail';
  static const String path = '/detail';

  Movie movie;

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  var dummy =
      'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec pharetra, lectus at bibendum dictum, dui metus molestie elit, in iaculis velit augue ut ante. Mauris scelerisque, tellus eget finibus rhoncus, dolor sapien tempor arcu, sit amet hendrerit est augue et arcu. Vestibulum dapibus lorem nec porttitor vulputate. Aliquam quis ante et ligula tristique interdum. Interdum et malesuada fames ac ante ipsum primis in faucibus. Quisque et consequat mi, sed posuere diam. Ut viverra vehicula posuere. Curabitur ac pharetra elit, ultrices dapibus metus. Mauris dignissim tellus facilisis finibus dictum.';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: moviedbAppBar(),
      body: SingleChildScrollView(
        child: Container(
          color: Colors.black,
          child: Column(
            children: [
              MovieDetailPoster(posterUrl: widget.movie.backdropPath),
              MovieDetailCard(movie: widget.movie),
              MovieDetailSynopsis(text: widget.movie.overview),
            ],
          ),
        ),
      ),
    );
  }
}
