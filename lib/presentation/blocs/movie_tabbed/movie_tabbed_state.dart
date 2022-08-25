part of 'movie_tabbed_bloc.dart';

abstract class MovieTabbedState extends Equatable {
  final int changedTabIndex;
  const MovieTabbedState({
    required this.changedTabIndex,
  });

  @override
  List<Object> get props => [changedTabIndex];
}

class MovieTabbedInitial extends MovieTabbedState {
  const MovieTabbedInitial({required super.changedTabIndex});
}

class MovieTabChanged extends MovieTabbedState {
  final List<MovieEntities> movies;
  const MovieTabChanged({
    required int currentTabIndex,
    required this.movies,
  }) : super(changedTabIndex: currentTabIndex);
  @override
  List<Object> get props => [movies, changedTabIndex];
}

class MovieTabChangeError extends MovieTabbedState {
  const MovieTabChangeError({required int currentTabIndex})
      : super(changedTabIndex: currentTabIndex);
}
