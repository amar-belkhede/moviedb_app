import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:moviedb_app/core/service/api_moviedb.dart';

class ApiMoviedbImpl implements ApiMoviedb {
  String BASE_URL = 'api.themoviedb.org';
  String API_KEY = 'b34f4e8dfbad314eb67d3343b89bf458';

  @override
  Future<http.Response?> search({
    String query = 'Spider man',
    int page = 1,
  }) async {
    http.Response? response;
    try {
      var url = Uri.https(BASE_URL, '/3/search/movie',
          {'api_key': API_KEY, 'query': query, 'page': page.toString()});

      response = await http.get(url);
      return response;
    } catch (e) {
      log(e.toString());
    }
    return response;
  }
}
