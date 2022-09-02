part of 'cast_and_crew_bloc.dart';

abstract class CastAndCrewState extends Equatable {
  const CastAndCrewState();

  @override
  List<Object> get props => [];
}

class CastAndCrewInitial extends CastAndCrewState {}

class CastAndCrewLoaded extends CastAndCrewState {
  final List<CastEntity> casts;
  const CastAndCrewLoaded({
    required this.casts,
  });
}

class CastAndCrewError extends CastAndCrewState {}
