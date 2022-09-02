import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_base/presentation/widgets/button.dart';
import 'package:movie_base/presentation/blocs/video/video_bloc.dart';
import 'package:sizer/sizer.dart';

class VideoWidget extends StatelessWidget {
  final VideoBloc videoBloc;
  const VideoWidget({
    Key? key,
    required this.videoBloc,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<VideoBloc, VideoState>(
      bloc: videoBloc,
      builder: (context, state) {
        if (state is VideoLoaded && state.videos.iterator.moveNext()) {
          final videos = state.videos;
          return Padding(
            padding: EdgeInsets.all(4.0.w),
            child: Button(
              title: 'Watch Trailers',
              ontap: () {},
            ),
          );
        }
        return Container();
      },
    );
  }
}
