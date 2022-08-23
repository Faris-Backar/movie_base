import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movie_base/domain/entities/movie_entities.dart';

part 'movie_backdrop_event.dart';
part 'movie_backdrop_state.dart';

class MovieBackdropBloc extends Bloc<MovieBackdropEvent, MovieBackdropState> {
  MovieBackdropBloc() : super(MovieBackdropInitial()) {
    on<MovieBackDropChangedEvent>((event, emit) {
      MovieBackDropChanged(movie: event.movie);
    });
  }
}
