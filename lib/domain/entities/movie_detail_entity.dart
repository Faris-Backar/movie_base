import 'package:equatable/equatable.dart';

class MovieDetailEntity extends Equatable {
  final int id;
  final String title;
  final String overview;
  final num voteAvarage;
  final String backdropPath;
  final String posterPath;
  final DateTime? releaseDate;
  const MovieDetailEntity({
    required this.id,
    required this.title,
    required this.overview,
    required this.voteAvarage,
    required this.backdropPath,
    required this.posterPath,
    this.releaseDate,
  });
  @override
  List<Object?> get props => [
        id,
      ];
}
