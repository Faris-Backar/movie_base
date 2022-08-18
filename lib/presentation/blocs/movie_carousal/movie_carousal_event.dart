part of 'movie_carousal_bloc.dart';

abstract class MovieCarousalEvent extends Equatable {
  const MovieCarousalEvent();

  @override
  List<Object> get props => [];
}

class CarousalLoadEvent extends MovieCarousalEvent {
  final int? defaultindex;
  const CarousalLoadEvent({
    this.defaultindex,
  });
  @override
  List<Object> get props => [defaultindex!];
}
