// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'movie_backdrop_bloc.dart';

abstract class MovieBackdropEvent extends Equatable {
  const MovieBackdropEvent();

  @override
  List<Object> get props => [];
}

class MovieBackDropChangedEvent extends MovieBackdropEvent {
  final MovieEntities movie;
  const MovieBackDropChangedEvent({
    required this.movie,
  });
  @override
  List<Object> get props => [movie];
}
