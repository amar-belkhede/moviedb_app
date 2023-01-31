import 'package:moviedb_app/core/model/pagination_result.dart';
import 'package:moviedb_app/core/service/api_moviedb_impl.dart';
import 'package:http/http.dart' as http;


abstract class ApiMoviedb {
  factory ApiMoviedb() => ApiMoviedbImpl();



  Future<http.Response?> search({String query = 'Spider man', int page = 1});
}
