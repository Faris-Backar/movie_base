// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'movie_detail_bloc.dart';

abstract class MovieDetailState extends Equatable {
  const MovieDetailState();

  @override
  List<Object> get props => [];
}

class MovieDetailInitial extends MovieDetailState {}

class MovieDetailLoading extends MovieDetailState {}

class MovieDetailLoaded extends MovieDetailState {
  final MovieDetailEntity movieDetail;
  const MovieDetailLoaded({
    required this.movieDetail,
  });
  @override
  List<Object> get props => [movieDetail];
}

class MovieDetailError extends MovieDetailState {}
