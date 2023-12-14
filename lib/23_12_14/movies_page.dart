import 'dart:convert';

class MoviesPage {
  MovieDates dates;
  int page;
  List<Movie> results;
  int totalPages;
  int totalResults;

  MoviesPage({
    required this.dates,
    required this.page,
    required this.results,
    required this.totalPages,
    required this.totalResults,
  });

  factory MoviesPage.fromJson(Map<String, dynamic> json) {
    // List<Movie> getMovieList(List<Map<String, dynamic>> results) {
    //   List<Movie> movieList = [];
    //   for (int i = 0; i < results.length; i++) {
    //     movieList.add(Movie.fromJson(results[i]));
    //   }
    //   return movieList;
    // }
    return MoviesPage(
      dates: MovieDates.fromJson(json['dates']),
      page: json['page'],
      // movies: getMovieList(json['results']),
      results: List<Movie>.from(json['results'].map((result) => Movie.fromJson(result))),
      totalPages: json['total_pages'],
      totalResults: json['total_results'],
    );
  }

  Map<String, dynamic> toJson() {
    // List<Movie> getMovieList(List<Movie> movies) {
    //   List<Movie> movieList = [];
    //   for (int i = 0; i < movies.length; i++) {
    //     movieList.add(jsonDecode(movies[i].toString()));
    //   }
    //   return movieList;
    // }
    final Map<String, dynamic> data = <String, dynamic>{};
    data['dates'] = dates.toJson();
    data['page'] = page;
    // data['results'] = getMovieList(movies);
    data['results'] = results.map((result) => result.toJson()).toList();
    data['total_pages'] = totalPages;
    data['total_results'] = totalResults;
    return data;
  }
}

class MovieDates {
  String maximum;
  String minimum;

  MovieDates({required this.maximum, required this.minimum});

  factory MovieDates.fromJson(Map<String, dynamic> json) {
    return MovieDates(
      maximum: json['maximum'],
      minimum: json['minimum'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['maximum'] = maximum;
    data['minimum'] = minimum;
    return data;
  }
}

class Movie {
  bool adult;
  // String backdropPath;
  String? backdropPath;
  List<int> genreIds;
  int id;
  String originalLanguage;
  String originalTitle;
  String overview;
  double popularity;
  String posterPath;
  String releaseDate;
  String title;
  bool video;
  double voteAverage;
  int voteCount;

  Movie({
    required this.adult,
    // required this.backdropPath,
    this.backdropPath,
    required this.genreIds,
    required this.id,
    required this.originalLanguage,
    required this.originalTitle,
    required this.overview,
    required this.popularity,
    required this.posterPath,
    required this.releaseDate,
    required this.title,
    required this.video,
    required this.voteAverage,
    required this.voteCount,
  });

  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(
      adult: json['adult'],
      backdropPath: json['backdrop_path'],
      // genreIds: json['genre_ids'].cast<int>(),
      genreIds: List<int>.from(json['genre_ids']),
      id: json['id'],
      originalLanguage: json['original_language'],
      originalTitle: json['original_title'],
      overview: json['overview'],
      popularity: json['popularity'],
      posterPath: json['poster_path'],
      releaseDate: json['release_date'],
      title: json['title'],
      video: json['video'],
      voteAverage: json['vote_average'],
      voteCount: json['vote_count'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['adult'] = adult;
    data['backdrop_path'] = backdropPath;
    data['genre_ids'] = genreIds;
    data['id'] = id;
    data['original_language'] = originalLanguage;
    data['original_title'] = originalTitle;
    data['overview'] = overview;
    data['popularity'] = popularity;
    data['poster_path'] = posterPath;
    data['release_date'] = releaseDate;
    data['title'] = title;
    data['video'] = video;
    data['vote_average'] = voteAverage;
    data['vote_count'] = voteCount;
    return data;
  }
}
