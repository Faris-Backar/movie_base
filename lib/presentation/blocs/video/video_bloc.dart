import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import 'package:movie_base/domain/entities/app_error.dart';
import 'package:movie_base/domain/entities/movie_params.dart';
import 'package:movie_base/domain/entities/video_entity.dart';
import 'package:movie_base/domain/usecase/get_videos.dart';

part 'video_event.dart';
part 'video_state.dart';

class VideoBloc extends Bloc<VideoEvent, VideoState> {
  final GetVideos getvideos;
  VideoBloc(
    this.getvideos,
  ) : super(VideoInitial()) {
    on<GetVideosEvent>(_getVideos);
  }

  _getVideos(GetVideosEvent event, Emitter<VideoState> emit) async {
    final Either<AppError, List<VideoEntity>> eitherResponse =
        await getvideos(MovieParams(id: event.movieId));
    return eitherResponse.fold(
      (l) => emit(
        VideoError(),
      ),
      (r) => emit(
        VideoLoaded(videos: r),
      ),
    );
  }
}
