class MovieModel {
  String? backdropPath;
  String? title;
  String? originalTitle;
  String? name;
  String? originalName;
  int? id;
  String? overview;
  String? posterPath;
  bool? adult;
  String? originalLanguage;
  double? popularity;
  String? releaseDate;
  String? firstAirDate;
  bool? video;
  double? voteAverage;
  int? voteCount;
  String? mediaType;

  MovieModel({
    required this.adult,
    required this.backdropPath,
    required this.id,
    required this.originalLanguage,
    required this.originalTitle,
    required this.originalName,
    required this.name,
    required this.overview,
    required this.popularity,
    required this.posterPath,
    required this.releaseDate,
    required this.firstAirDate,
    required this.title,
    required this.video,
    required this.voteAverage,
    required this.voteCount,
    required this.mediaType,
  });

  factory MovieModel.fromJSon(Map<String, dynamic> json) {
    return MovieModel(
      adult: json['adult'],
      backdropPath: json['backdrop_path'],
      id: json['id'],
      originalLanguage: json['original_language'],
      originalTitle: json['original_title'],
      originalName: json['original_name'],
      name: json['name'],
      overview: json['overview'],
      popularity: json['popularity']?.toDouble(),
      posterPath: json['poster_path'],
      releaseDate: json['release_date'],
      firstAirDate: json['first_air_date'],
      title: json['title'],
      video: json['video'],
      voteAverage: json['vote_average']?.toDouble(),
      voteCount: json['vote_count'],
      mediaType: json['media_type'],
    );
  }
}
