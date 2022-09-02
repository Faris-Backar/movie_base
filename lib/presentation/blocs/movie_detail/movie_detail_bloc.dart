import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:movie_base/domain/entities/app_error.dart';

import 'package:movie_base/domain/entities/movie_detail_entity.dart';
import 'package:movie_base/domain/entities/movie_params.dart';
import 'package:movie_base/domain/usecase/get_movie_details.dart';

part 'movie_detail_event.dart';
part 'movie_detail_state.dart';

class MovieDetailBloc extends Bloc<MovieDetailEvent, MovieDetailState> {
  final GetMovieDetails getMovieDetails;
  MovieDetailBloc(
    this.getMovieDetails,
  ) : super(MovieDetailInitial()) {
    on<MovieDetailLoadEvent>(
      _getMovieDetails,
    );
  }

  _getMovieDetails(
      MovieDetailLoadEvent event, Emitter<MovieDetailState> emit) async {
    final Either<AppError, MovieDetailEntity> eitherResponse =
        await getMovieDetails(MovieParams(id: event.id));
    return eitherResponse.fold(
      (l) => emit(
        MovieDetailError(),
      ),
      (r) => emit(
        MovieDetailLoaded(movieDetail: r),
      ),
    );
  }
}
