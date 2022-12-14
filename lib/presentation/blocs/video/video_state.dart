part of 'video_bloc.dart';

abstract class VideoState extends Equatable {
  const VideoState();

  @override
  List<Object> get props => [];
}

class VideoInitial extends VideoState {}

class VideoLoaded extends VideoState {
  final List<VideoEntity> videos;
  const VideoLoaded({
    required this.videos,
  });

  @override
  List<Object> get props => [videos];
}

class NoVideos extends VideoState {}

class VideoError extends VideoState {}
