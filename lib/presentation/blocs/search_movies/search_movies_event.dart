part of 'search_movies_bloc.dart';

abstract class SearchMoviesEvent extends Equatable {
  const SearchMoviesEvent();

  @override
  List<Object> get props => [];
}

class GetSearchMovieEvent extends SearchMoviesEvent {
  final String searchMovies;
  const GetSearchMovieEvent({
    required this.searchMovies,
  });

  @override
  List<Object> get props => [searchMovies];
}
