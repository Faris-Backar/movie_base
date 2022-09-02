import 'package:movie_base/domain/entities/video_entity.dart';

class WatchVideoArguments {
  final List<VideoEntity> videos;
  WatchVideoArguments({
    required this.videos,
  });
}
