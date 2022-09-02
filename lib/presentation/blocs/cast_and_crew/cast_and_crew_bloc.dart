import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:movie_base/domain/entities/app_error.dart';
import 'package:movie_base/domain/entities/cast_entity.dart';
import 'package:movie_base/domain/entities/movie_params.dart';
import 'package:movie_base/domain/usecase/get_cast.dart';

part 'cast_and_crew_event.dart';
part 'cast_and_crew_state.dart';

class CastAndCrewBloc extends Bloc<CastAndCrewEvent, CastAndCrewState> {
  final GetCast getCast;

  CastAndCrewBloc(
    this.getCast,
  ) : super(CastAndCrewInitial()) {
    on<GetCastAndCrewLoaded>(_getCastAndCrew);
  }
  _getCastAndCrew(
      GetCastAndCrewLoaded event, Emitter<CastAndCrewState> emit) async {
    Either<AppError, List<CastEntity>> either =
        await getCast(MovieParams(id: event.movieId));
    return either.fold((l) => emit(CastAndCrewError()),
        (r) => emit(CastAndCrewLoaded(casts: r)));
  }
}
