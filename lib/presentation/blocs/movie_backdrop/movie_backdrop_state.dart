// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'movie_backdrop_bloc.dart';

abstract class MovieBackdropState extends Equatable {
  const MovieBackdropState();

  @override
  List<Object> get props => [];
}

class MovieBackdropInitial extends MovieBackdropState {}

class MovieBackDropChanged extends MovieBackdropState {
  final MovieEntities movie;
  const MovieBackDropChanged({
    required this.movie,
  });
  @override
  List<Object> get props => [movie];
}
