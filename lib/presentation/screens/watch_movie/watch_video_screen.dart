import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movie_base/data/models/video_result_model.dart';
import 'package:movie_base/domain/entities/video_entity.dart';
import 'package:movie_base/presentation/screens/watch_movie/watch_video_argument.dart';
import 'package:movie_base/presentation/themes/app_color.dart';
import 'package:sizer/sizer.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class WatchVideoScreen extends StatefulWidget {
  final WatchVideoArguments watchVideoArguments;
  const WatchVideoScreen({
    Key? key,
    required this.watchVideoArguments,
  }) : super(key: key);

  @override
  State<WatchVideoScreen> createState() => _WatchVideoScreenState();
}

class _WatchVideoScreenState extends State<WatchVideoScreen> {
  late List<VideoEntity> _video;
  late YoutubePlayerController _controller;

  @override
  void initState() {
    super.initState();
    _video = widget.watchVideoArguments.videos;
    _controller = YoutubePlayerController(
      initialVideoId: _video[0].key!,
      flags: const YoutubePlayerFlags(
        autoPlay: true,
        mute: true,
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.vulcan,
        title: const Text('Watch Trailers'),
      ),
      body: YoutubePlayerBuilder(
        player: YoutubePlayer(
          controller: _controller,
          aspectRatio: 16 / 9,
          showVideoProgressIndicator: true,
          progressIndicatorColor: Colors.amber,
          progressColors: const ProgressBarColors(
            playedColor: Colors.amber,
            handleColor: Colors.amberAccent,
          ),
        ),
        builder: (context, player) => Column(
          children: [
            player,
            Expanded(
                child: SingleChildScrollView(
              child: Column(
                children: [
                  for (int i = 0; i < _video.length; i++)
                    Container(
                      height: 20.h,
                      padding: EdgeInsets.symmetric(vertical: 1.h),
                      child: Row(
                        children: [
                          GestureDetector(
                            onTap: () {
                              _controller.load(_video[i].key!);
                              _controller.play();
                            },
                            child: CachedNetworkImage(
                              width: 40.w,
                              imageUrl: YoutubePlayer.getThumbnail(
                                videoId: _video[i].key!,
                                quality: ThumbnailQuality.high,
                              ),
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal: 8.w,
                              ),
                              child: Text(
                                _video[i].title!,
                                style: Theme.of(context)
                                    .textTheme
                                    .subtitle1!
                                    .copyWith(fontSize: 14.sp),
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                ],
              ),
            ))
          ],
        ),
      ),
    );
  }
}
