// ignore_for_file: annotate_overrides, overridden_fields, must_be_immutable

import 'package:movie_base/domain/entities/movie_entities.dart';

class MovieModel extends MovieEntities {
  MovieModel({
    required this.adult,
    required this.backdropPath,
    required this.id,
    this.title,
    this.originalLanguage,
    this.originalTitle,
    required this.overview,
    required this.posterPath,
    this.mediaType,
    required this.genreIds,
    required this.popularity,
    this.releaseDate,
    this.video,
    required this.voteAverage,
    required this.voteCount,
    this.name,
    this.originalName,
    this.firstAirDate,
    this.originCountry,
  }) : super(
            id: id,
            title: title,
            backdropPath: backdropPath,
            posterPath: posterPath,
            releaseDate: releaseDate,
            voteAverage: voteAverage,
            overview: overview);

  final bool adult;
  String backdropPath;
  final int id;
  final String? title;
  final OriginalLanguage? originalLanguage;
  final String? originalTitle;
  final String overview;
  final String posterPath;
  final MediaType? mediaType;
  final List<int> genreIds;
  final double popularity;
  final DateTime? releaseDate;
  final bool? video;
  final double voteAverage;
  final int voteCount;
  final String? name;
  final String? originalName;
  final DateTime? firstAirDate;
  final List<String>? originCountry;

  factory MovieModel.fromJson(Map<String, dynamic> json) => MovieModel(
        adult: json["adult"],
        backdropPath: json["backdrop_path"],
        id: json["id"],
        title: json["title"] ?? null,
        originalLanguage: originalLanguageValues.map[json["original_language"]],
        originalTitle: json["original_title"] ?? '',
        overview: json["overview"],
        posterPath: json["poster_path"],
        mediaType: mediaTypeValues.map[json["media_type"]],
        genreIds: List<int>.from(json["genre_ids"].map((x) => x)),
        popularity: json["popularity"].toDouble() ?? 0.0,
        releaseDate: json["release_date"] == null
            ? null
            : DateTime.parse(json["release_date"]),
        video: json["video"] ?? false,
        voteAverage: json["vote_average"].toDouble() ?? 0.0,
        voteCount: json["vote_count"],
        name: json["name"] ?? null,
        originalName: json["original_name"] ?? null,
        firstAirDate: json["first_air_date"] == null
            ? null
            : DateTime.parse(json["first_air_date"]),
        originCountry: json["origin_country"] == null
            ? null
            : List<String>.from(json["origin_country"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "adult": adult,
        "backdrop_path": backdropPath,
        "id": id,
        "title": title == null ? null : title,
        "original_language": originalLanguageValues.reverse[originalLanguage],
        "original_title": originalTitle == null ? null : originalTitle,
        "overview": overview,
        "poster_path": posterPath,
        "media_type": mediaTypeValues.reverse[mediaType],
        "genre_ids": List<dynamic>.from(genreIds.map((x) => x)),
        "popularity": popularity,
        "release_date": releaseDate == null
            ? null
            : "${releaseDate!.year.toString().padLeft(4, '0')}-${releaseDate!.month.toString().padLeft(2, '0')}-${releaseDate!.day.toString().padLeft(2, '0')}",
        "video": video == null ? null : video,
        "vote_average": voteAverage,
        "vote_count": voteCount,
        "name": name == null ? null : name,
        "original_name": originalName == null ? null : originalName,
        "first_air_date": firstAirDate == null
            ? null
            : "${firstAirDate!.year.toString().padLeft(4, '0')}-${firstAirDate!.month.toString().padLeft(2, '0')}-${firstAirDate!.day.toString().padLeft(2, '0')}",
        "origin_country": originCountry == null
            ? null
            : List<dynamic>.from(originCountry!.map((x) => x)),
      };
}

enum MediaType { MOVIE, TV }

final mediaTypeValues =
    EnumValues({"movie": MediaType.MOVIE, "tv": MediaType.TV});

enum OriginalLanguage { EN, KO, DE, ES }

final originalLanguageValues = EnumValues({
  "de": OriginalLanguage.DE,
  "en": OriginalLanguage.EN,
  "es": OriginalLanguage.ES,
  "ko": OriginalLanguage.KO
});

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String>? reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap!;
  }
}
