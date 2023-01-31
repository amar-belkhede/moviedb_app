import 'dart:convert';

class Movie {
  int voteCount;
  int id;
  bool video;
  num voteAverage;
  String title;
  double popularity;
  String posterPath;
  String originalLanguage;
  String originalTitle;
  List<int> genreIds;
  String backdropPath;
  bool adult;
  String overview;
  DateTime releaseDate;
  Movie({
    required this.voteCount,
    required this.id,
    required this.video,
    required this.voteAverage,
    required this.title,
    required this.popularity,
    required this.posterPath,
    required this.originalLanguage,
    required this.originalTitle,
    required this.genreIds,
    required this.backdropPath,
    required this.adult,
    required this.overview,
    required this.releaseDate,
  });

  // Movie({
  //   required this.voteCount,
  //   required this.id,
  //   required this.video,
  //   required this.voteAverage,
  //   required this.title,
  //   required this.popularity,
  //   required this.posterPath,
  //   required this.originalLanguage,
  //   required this.originalTitle,
  //   required this.genreIds,
  //   required this.backdropPath,
  //   required this.adult,
  //   required this.overview,
  //   required this.releaseDate,
  // });

  // factory Movie.fromJson(Map<String, dynamic> json) {
  //   return Movie(
  //     voteCount: json['vote_count'],
  //     id: json['id'],
  //     video: json['video'],
  //     voteAverage: json['vote_average'],
  //     title: json['title'],
  //     popularity: json['popularity'],
  //     posterPath: json['poster_path'],
  //     originalLanguage: json['original_language'],
  //     originalTitle: json['original_title'],
  //     genreIds: json['genre_ids'].cast<int>(),
  //     backdropPath: json['backdrop_path'],
  //     adult: json['adult'],
  //     overview: json['overview'],
  //     releaseDate: DateTime.parse(json['release_date']),
  //   );
  // }

  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = <String, dynamic>{};
  //   data['vote_count'] = voteCount;
  //   data['id'] = id;
  //   data['video'] = video;
  //   data['vote_average'] = voteAverage;
  //   data['title'] = title;
  //   data['popularity'] = popularity;
  //   data['poster_path'] = posterPath;
  //   data['original_language'] = originalLanguage;
  //   data['original_title'] = originalTitle;
  //   data['genre_ids'] = genreIds;
  //   data['backdrop_path'] = backdropPath;
  //   data['adult'] = adult;
  //   data['overview'] = overview;
  //   data['release_date'] = releaseDate;
  //   return data;
  // }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'voteCount': voteCount});
    result.addAll({'id': id});
    result.addAll({'video': video});
    result.addAll({'voteAverage': voteAverage});
    result.addAll({'title': title});
    result.addAll({'popularity': popularity});
    result.addAll({'posterPath': posterPath});
    result.addAll({'originalLanguage': originalLanguage});
    result.addAll({'originalTitle': originalTitle});
    result.addAll({'genreIds': genreIds});
    result.addAll({'backdropPath': backdropPath});
    result.addAll({'adult': adult});
    result.addAll({'overview': overview});
    result.addAll({'releaseDate': releaseDate.millisecondsSinceEpoch});

    return result;
  }

  factory Movie.fromMap(Map<String, dynamic> map) {
    DateTime date;
    if (map['release_date'] == null || map['release_date'] == "") {
      date = DateTime.now();
    } else {
      date = DateTime.parse(map['release_date']);
    }

    return Movie(
      voteCount: map['vote_count']?.toInt() ?? 0,
      id: map['id']?.toInt() ?? 0,
      video: map['video'] ?? false,
      voteAverage: map['vote_average'] ?? 0,
      title: map['title'] ?? 'Spider-Man',
      popularity: map['popularity']?.toDouble() ?? 0.0,
      posterPath: 'https://image.tmdb.org/t/p/w500${map['poster_path']}',
      originalLanguage: map['original_language'] ?? '',
      originalTitle: map['original_title'] ?? '',
      genreIds: List<int>.from(map['genre_ids']),
      backdropPath: 'https://image.tmdb.org/t/p/w500${map['backdrop_path']}',
      adult: map['adult'] ?? false,
      overview: map['overview'] ??
          'After being bitten by a genetically altered spider at Oscorp, nerdy but endearing high school student Peter Parker is endowed',
      releaseDate: date,
    );
  }

  DateTime _getDateTime(String date) {
    if (date == "") return DateTime.now();
    return DateTime.parse(date);
  }

  String toJson() => json.encode(toMap());

  factory Movie.fromJson(String source) => Movie.fromMap(json.decode(source));
}
