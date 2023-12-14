class MovieInfoDetails {
  bool adult;
  String? backdropPath;
  BelongsToCollection? belongsToCollection;
  int budget;
  List<Genre> genres;
  String homepage;
  int id;
  String? imdbId;
  String originalLanguage;
  String originalTitle;
  String overview;
  double popularity;
  String posterPath;
  List<ProductionCompany> productionCompanies;
  List<ProductionCountry> productionCountries;
  String releaseDate;
  int revenue;
  int runtime;
  List<SpokenLanguage> spokenLanguages;
  String status;
  String tagline;
  String title;
  bool video;
  double voteAverage;
  int voteCount;

  MovieInfoDetails({
    required this.adult,
    this.backdropPath,
    this.belongsToCollection,
    required this.budget,
    required this.genres,
    required this.homepage,
    required this.id,
    this.imdbId,
    required this.originalLanguage,
    required this.originalTitle,
    required this.overview,
    required this.popularity,
    required this.posterPath,
    required this.productionCompanies,
    required this.productionCountries,
    required this.releaseDate,
    required this.revenue,
    required this.runtime,
    required this.spokenLanguages,
    required this.status,
    required this.tagline,
    required this.title,
    required this.video,
    required this.voteAverage,
    required this.voteCount,
  });

  factory MovieInfoDetails.fromJson(Map<String, dynamic> json) {
    return MovieInfoDetails(
      adult: json['adult'],
      backdropPath: json['backdrop_path'],
      belongsToCollection: json['belongs_to_collection'] != null ? BelongsToCollection.fromJson(json['belongs_to_collection']) : null,
      budget: json['budget'],
      genres: List<Genre>.from(json['genres'].map((genre) => Genre.fromJson(genre))),
      homepage: json['homepage'],
      id: json['id'],
      imdbId: json['imdb_id'],
      originalLanguage: json['original_language'],
      originalTitle: json['original_title'],
      overview: json['overview'],
      popularity: json['popularity'],
      posterPath: json['poster_path'],
      productionCompanies: List<ProductionCompany>.from(
        json['production_companies'].map((company) => ProductionCompany.fromJson(company)),
      ),
      productionCountries: List<ProductionCountry>.from(
        json['production_countries'].map((country) => ProductionCountry.fromJson(country)),
      ),
      releaseDate: json['release_date'],
      revenue: json['revenue'],
      runtime: json['runtime'],
      spokenLanguages: List<SpokenLanguage>.from(
        json['spoken_languages'].map((language) => SpokenLanguage.fromJson(language)),
      ),
      status: json['status'],
      tagline: json['tagline'],
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
    data['belongs_to_collection'] = belongsToCollection?.toJson();
    data['budget'] = budget;
    data['genres'] = genres.map((genre) => genre.toJson()).toList();
    data['homepage'] = homepage;
    data['id'] = id;
    data['imdb_id'] = imdbId;
    data['original_language'] = originalLanguage;
    data['original_title'] = originalTitle;
    data['overview'] = overview;
    data['popularity'] = popularity;
    data['poster_path'] = posterPath;
    data['production_companies'] = productionCompanies.map((company) => company.toJson()).toList();
    data['production_countries'] = productionCountries.map((country) => country.toJson()).toList();
    data['release_date'] = releaseDate;
    data['revenue'] = revenue;
    data['runtime'] = runtime;
    data['spoken_languages'] = spokenLanguages.map((language) => language.toJson()).toList();
    data['status'] = status;
    data['tagline'] = tagline;
    data['title'] = title;
    data['video'] = video;
    data['vote_average'] = voteAverage;
    data['vote_count'] = voteCount;
    return data;
  }
}

class BelongsToCollection {
  int id;
  String name;
  String posterPath;
  String backdropPath;

  BelongsToCollection({
    required this.id,
    required this.name,
    required this.posterPath,
    required this.backdropPath,
  });

  factory BelongsToCollection.fromJson(Map<String, dynamic> json) {
    return BelongsToCollection(
      id: json['id'],
      name: json['name'],
      posterPath: json['poster_path'],
      backdropPath: json['backdrop_path'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['poster_path'] = posterPath;
    data['backdrop_path'] = backdropPath;
    return data;
  }
}

class Genre {
  int id;
  String name;

  Genre({
    required this.id,
    required this.name,
  });

  factory Genre.fromJson(Map<String, dynamic> json) {
    return Genre(
      id: json['id'],
      name: json['name'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    return data;
  }
}

class ProductionCompany {
  int id;
  String? logoPath;
  String name;
  String originCountry;

  ProductionCompany({
    required this.id,
    this.logoPath,
    required this.name,
    required this.originCountry,
  });

  factory ProductionCompany.fromJson(Map<String, dynamic> json) {
    return ProductionCompany(
      id: json['id'],
      logoPath: json['logo_path'],
      name: json['name'],
      originCountry: json['origin_country'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['logo_path'] = logoPath;
    data['name'] = name;
    data['origin_country'] = originCountry;
    return data;
  }
}

class ProductionCountry {
  String iso31661;
  String name;

  ProductionCountry({
    required this.iso31661,
    required this.name,
  });

  factory ProductionCountry.fromJson(Map<String, dynamic> json) {
    return ProductionCountry(
      iso31661: json['iso_3166_1'],
      name: json['name'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['iso_3166_1'] = iso31661;
    data['name'] = name;
    return data;
  }
}

class SpokenLanguage {
  String englishName;
  String iso6391;
  String name;

  SpokenLanguage({
    required this.englishName,
    required this.iso6391,
    required this.name,
  });

  factory SpokenLanguage.fromJson(Map<String, dynamic> json) {
    return SpokenLanguage(
      englishName: json['english_name'],
      iso6391: json['iso_639_1'],
      name: json['name'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['english_name'] = englishName;
    data['iso_639_1'] = iso6391;
    data['name'] = name;
    return data;
  }
}