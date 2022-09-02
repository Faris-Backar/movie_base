import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_base/di/get_it.dart';
import 'package:movie_base/presentation/blocs/cast_and_crew/cast_and_crew_bloc.dart';
import 'package:movie_base/presentation/blocs/movie_detail/movie_detail_bloc.dart';
import 'package:movie_base/presentation/blocs/video/video_bloc.dart';
import 'package:movie_base/presentation/screens/movie_detail/big_poster.dart';
import 'package:movie_base/presentation/screens/movie_detail/cast_widget.dart';
import 'package:movie_base/presentation/screens/movie_detail/movie_detail_argument.dart';
import 'package:movie_base/presentation/screens/movie_detail/video_widget.dart';
import 'package:sizer/sizer.dart';

class MovieDetailScreen extends StatefulWidget {
  final MovieDetailArguments movieDetailArguments;

  const MovieDetailScreen({
    Key? key,
    required this.movieDetailArguments,
  }) : super(key: key);

  @override
  State<MovieDetailScreen> createState() => _MovieDetailScreenState();
}

class _MovieDetailScreenState extends State<MovieDetailScreen> {
  late MovieDetailBloc _movieDetailBloc;
  late CastAndCrewBloc _castAndCrewBloc;
  late VideoBloc _videoBloc;

  @override
  void initState() {
    super.initState();
    _movieDetailBloc = getItInstance<MovieDetailBloc>();
    _castAndCrewBloc = getItInstance<CastAndCrewBloc>();
    _videoBloc = getItInstance<VideoBloc>();
    _movieDetailBloc
        .add(MovieDetailLoadEvent(id: widget.movieDetailArguments.movieId));
    _castAndCrewBloc.add(
        GetCastAndCrewLoaded(movieId: widget.movieDetailArguments.movieId));
    _videoBloc
        .add(GetVideosEvent(movieId: widget.movieDetailArguments.movieId));
  }

  @override
  void dispose() {
    _movieDetailBloc.close();
    _castAndCrewBloc.close();
    _videoBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MultiBlocProvider(
        providers: [
          BlocProvider<MovieDetailBloc>.value(
            value: _movieDetailBloc,
          ),
          BlocProvider<CastAndCrewBloc>.value(
            value: _castAndCrewBloc,
          ),
          BlocProvider<VideoBloc>.value(
            value: _videoBloc,
          ),
        ],
        child: BlocBuilder<MovieDetailBloc, MovieDetailState>(
          builder: (context, state) {
            if (state is MovieDetailLoaded) {
              final movieDetails = state.movieDetail;
              return SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    BigPoster(movie: movieDetails),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 5.w,
                      ),
                      child: Text(
                        movieDetails.overview,
                        style: Theme.of(context).textTheme.bodyText2,
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 5.w, vertical: 5.w),
                      child: Text(
                        'Cast',
                        style: Theme.of(context).textTheme.headline6,
                      ),
                    ),
                    const CastWidget(),
                    VideoWidget(videoBloc: _videoBloc),
                  ],
                ),
              );
            } else if (state is MovieDetailError) {
              return Container();
            }
            return const SizedBox.shrink();
          },
        ),
      ),
    );
  }
}
