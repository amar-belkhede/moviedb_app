import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:moviedb_app/core/model/movie.dart';
import 'package:moviedb_app/core/model/movie_filter.dart';
import 'package:moviedb_app/core/model/pagination_result.dart';
import 'package:moviedb_app/core/service/api_moviedb.dart';

class MovieProvider extends ChangeNotifier {
  
  MovieProvider() {
    getMovie(query: 'Spider man', page: 1);
  }

  final ApiMoviedb api = ApiMoviedb();

  String _query = '';
  int _page = 1;
  int _totalPage = 1;
  bool _loading = false;
  MovieFilter _filter = MovieFilter.popular;
  PaginationResult? _result;
  bool _error = false;

  List<Movie> get getMovieList => _result?.movieList ?? [];
  MovieFilter get getMovieFilter => _filter;
  int get getPage => _page;
  bool get loading => _loading;
  bool get error => _error;

  Future<void> getMovie({required String query, required int page}) async {
    _error = false;
    _loading = true;
    _query = query;
    notifyListeners();

    http.Response? response = await api.search(query: query, page: page);
    if (response == null) {
      _error = true;
      _loading = false;
      notifyListeners();
      return;
    }

    if (response.statusCode == 200) {
      _result = PaginationResult.fromJson(response.body);
      _page = _result?.page ?? 1;
      _totalPage = _result?.totalPage ?? 1;
      _rearangeMovie();
    }

    _error = false;
    _loading = false;
    notifyListeners();
  }

  void nextMoviePage() {
    if (_page < _totalPage) {
      getMovie(query: _query, page: _page + 1);
    }
  }

  void previousMoviePage() {
    if (_page > 1) {
      getMovie(query: _query, page: _page - 1);
    }
  }

  void changeMovieFilter({required MovieFilter value}) {
    _filter = value;
    _error = false;
    _loading = false;
    _rearangeMovie();
    notifyListeners();
  }

  void _rearangeMovie() {
    if (_filter == MovieFilter.popular) {
      _result?.movieList.sort((movie1, movie2) =>
          movie2.popularity.toInt() - movie1.popularity.toInt());
      _error = false;
      _loading = false;
      notifyListeners();
    }

    if (_filter == MovieFilter.topRated) {
      _result?.movieList.sort((movie1, movie2) =>
          movie2.voteAverage.toInt() - movie1.voteAverage.toInt());
      _error = false;
      _loading = false;
      notifyListeners();
    }
  }
}
