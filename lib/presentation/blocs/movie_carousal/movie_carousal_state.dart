part of 'movie_carousal_bloc.dart';

abstract class MovieCarousalState extends Equatable {
  const MovieCarousalState();

  @override
  List<Object?> get props => [];
}

class MovieCarousalInitial extends MovieCarousalState {}

class MovieCarousalLoaded extends MovieCarousalState {
  final List<MovieEntities> movies;
  final int? defaultIndex;
  const MovieCarousalLoaded({
    required this.movies,
    this.defaultIndex,
  });

  @override
  List<Object?> get props => [movies, defaultIndex];
}

class MovieCarousalErrror extends MovieCarousalState {}
