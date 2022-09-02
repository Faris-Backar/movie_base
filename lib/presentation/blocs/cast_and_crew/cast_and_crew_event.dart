part of 'cast_and_crew_bloc.dart';

abstract class CastAndCrewEvent extends Equatable {
  const CastAndCrewEvent();

  @override
  List<Object> get props => [];
}

class GetCastAndCrewLoaded extends CastAndCrewEvent {
  final int movieId;
  const GetCastAndCrewLoaded({
    required this.movieId,
  });

  @override
  List<Object> get props => [movieId];
}
