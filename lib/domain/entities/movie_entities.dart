import 'package:equatable/equatable.dart';

class MovieEntities extends Equatable {
  final String? posterPath;
  final int? id;
  final String? backdropPath;
  final String? title;
  final num? voteAverage;
  final DateTime? releaseDate;
  final String? overview;
  const MovieEntities({
    this.posterPath,
    this.id,
    this.backdropPath,
    this.title,
    this.voteAverage,
    this.releaseDate,
    this.overview,
  });
  @override
  List<Object?> get props => [id, title];

  @override
  bool get stringify => true;
}
