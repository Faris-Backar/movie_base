import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:movie_base/domain/entities/app_error.dart';
import 'package:movie_base/domain/entities/movie_entities.dart';
import 'package:movie_base/domain/entities/no_params.dart';
import 'package:movie_base/domain/usecase/get_latest.dart';
import 'package:movie_base/domain/usecase/get_now_playing.dart';
import 'package:movie_base/domain/usecase/get_popular.dart';
import 'package:movie_base/domain/usecase/get_trending.dart';

part 'movie_tabbed_event.dart';
part 'movie_tabbed_state.dart';

class MovieTabbedBloc extends Bloc<MovieTabbedEvent, MovieTabbedState> {
  final GetPopular getpopular;
  final GetLatest getLatest;
  final GetNowPlaying getNowPlaying;
  final GetTrending getTrending;
  MovieTabbedBloc(
      {required this.getpopular,
      required this.getLatest,
      required this.getNowPlaying,
      required this.getTrending})
      : super(const MovieTabbedInitial(changedTabIndex: 0)) {
    on<MovieTabChangedEvent>((event, emit) => _movieTabChanged(event, emit));
  }
  _movieTabChanged(
      MovieTabChangedEvent event, Emitter<MovieTabbedState> emit) async {
    late Either<AppError, List<MovieEntities>> movieEither;
    switch (event.currentTabIndex) {
      case 0:
        movieEither = await getpopular(NoParams());
        break;
      case 1:
        movieEither = await getLatest(NoParams());
        break;
      case 2:
        movieEither = await getNowPlaying(NoParams());
        break;
      case 3:
        movieEither = await getTrending(NoParams());
        break;
    }
    return movieEither.fold(
      (l) => emit(MovieTabChangeError(currentTabIndex: event.currentTabIndex)),
      (movies) => emit(MovieTabChanged(
          currentTabIndex: event.currentTabIndex, movies: movies)),
    );
  }
}
