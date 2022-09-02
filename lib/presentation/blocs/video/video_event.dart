part of 'video_bloc.dart';

abstract class VideoEvent extends Equatable {
  const VideoEvent();

  @override
  List<Object> get props => [];
}

class GetVideosEvent extends VideoEvent {
  final int movieId;
  const GetVideosEvent({
    required this.movieId,
  });

  @override
  List<Object> get props => [movieId];
}
