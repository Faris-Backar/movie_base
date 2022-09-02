import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movie_base/domain/entities/app_error.dart';
import 'package:movie_base/domain/entities/movie_entities.dart';
import 'package:movie_base/domain/entities/no_params.dart';
import 'package:movie_base/domain/usecase/get_trending.dart';

part 'movie_carousal_event.dart';
part 'movie_carousal_state.dart';

class MovieCarousalBloc extends Bloc<MovieCarousalEvent, MovieCarousalState> {
  final GetTrending getTrending;
  MovieCarousalBloc({required this.getTrending})
      : super(MovieCarousalInitial()) {
    on<CarousalLoadEvent>(_getCarousalMovies);
  }
  _getCarousalMovies(
      CarousalLoadEvent event, Emitter<MovieCarousalState> emit) async {
    final moviesEither = await getTrending(NoParams());
    log('here');
    emit(MovieCarousalInitial());
    moviesEither
        .fold((l) => emit(MovieCarousalErrror(appErrorType: l.appErrorType)),
            (movies) {
      emit(
        MovieCarousalLoaded(
          movies: movies,
        ),
      );
    });
  }
}
