import 'dart:convert';

import 'package:moviedb_app/core/model/movie.dart';

class PaginationResult {
  int page;
  List<Movie> movieList;
  int totalPage;
  int totalResult;

  PaginationResult({
    required this.page,
    required this.movieList,
    required this.totalPage,
    required this.totalResult,
  });

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'page': page});
    result.addAll({'results': movieList.map((x) => x.toMap()).toList()});
    result.addAll({'total_pages': totalPage});
    result.addAll({'total_results': totalResult});

    return result;
  }

  factory PaginationResult.fromMap(Map<String, dynamic> map) {
    return PaginationResult(
      page: map['page']?.toInt() ?? 0,
      movieList: List<Movie>.from(map['results']?.map((x) => Movie.fromMap(x))),
      totalPage: map['total_pages']?.toInt() ?? 0,
      totalResult: map['total_results']?.toInt() ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory PaginationResult.fromJson(String source) =>
      PaginationResult.fromMap(json.decode(source));
}
