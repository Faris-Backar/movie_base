// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import 'package:movie_base/domain/entities/app_error.dart';
import 'package:movie_base/domain/entities/movie_entities.dart';
import 'package:movie_base/domain/entities/movie_params.dart';
import 'package:movie_base/domain/entities/search_movie_params.dart';
import 'package:movie_base/domain/usecase/search_movies.dart';

part 'search_movies_event.dart';
part 'search_movies_state.dart';

class SearchMoviesBloc extends Bloc<SearchMoviesEvent, SearchMoviesState> {
  final GetSearchmovies searchmovies;
  SearchMoviesBloc(
    this.searchmovies,
  ) : super(SearchMoviesInitial()) {
    on<GetSearchMovieEvent>(_getSearchedMovies);
  }
  _getSearchedMovies(
      GetSearchMovieEvent event, Emitter<SearchMoviesState> emit) async {
    if (event.searchMovies.length > 2) {
      Either<AppError, List<MovieEntities>> either =
          await searchmovies(SearchMovieParams(searchTerm: event.searchMovies));
      return either.fold(
        (l) => emit(SearchMoviesError()),
        (r) => emit(
          SearchMoviesLoaded(movies: r),
        ),
      );
    }
  }
}
