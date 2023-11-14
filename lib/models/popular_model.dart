class PopularModel {
  PopularModel({
    this.adult,
    this.backdropPath,
    this.genreIds,
    this.id,
    this.originalLanguage,
    this.originalTitle,
    this.overview,
    this.popularity,
    this.posterPath,
    this.releaseDate,
    this.title,
    this.video,
    this.voteAverage,
    this.voteCount,
    required this.isFavorite,
  });

  bool? adult;
  String? backdropPath;
  List<int>? genreIds;
  int? id;
  String? originalLanguage;
  String? originalTitle;
  String? overview;
  double? popularity;
  String? posterPath;
  String? releaseDate;
  String? title;
  bool? video;
  double? voteAverage;
  int? voteCount;
  bool isFavorite;
  factory PopularModel.fromMap(Map<String, dynamic> map) {
    return PopularModel(
      backdropPath: map['backdrop_path'] ?? '',
      id: map['id'],
      originalLanguage: map['original_language'],
      originalTitle: map['original_title'],
      overview: map['overview'],
      popularity: map['popularity'],
      posterPath: map['poster_path'] ?? '',
      releaseDate: map['release_date'],
      title: map['title'],
      voteAverage: (map['vote_average'] is int)
          ? (map['vote_average'] as int).toDouble()
          : map['vote_average'],
      voteCount: map['vote_count'],
      isFavorite: false,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'backdropPath': backdropPath,
      'originalLanguage': originalLanguage,
      'originalTitle': originalTitle,
      'overview': overview,
      'popularity': popularity,
      'posterPath': posterPath,
      'releaseDate': releaseDate,
      'title': title,
      'voteAverage': voteAverage,
      'voteCount': voteCount,
      'isFavorite': isFavorite
          ? 1
          : 0, // Agregar la columna 'isFavorite' para indicar si es favorita
    };
  }
}
