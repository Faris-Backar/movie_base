import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_base/di/get_it.dart';
import 'package:movie_base/presentation/blocs/movie_detail/movie_detail_bloc.dart';
import 'package:movie_base/presentation/screens/movie_detail/big_poster.dart';
import 'package:movie_base/presentation/screens/movie_detail/movie_detail_argument.dart';
import 'package:sizer/sizer.dart';
// import 'package:movie_base/presentation/themes/theme_text.dart' as text_theme;

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

  @override
  void initState() {
    super.initState();
    _movieDetailBloc = getItInstance<MovieDetailBloc>();
    _movieDetailBloc.add(
      MovieDetailLoadEvent(id: widget.movieDetailArguments.movieId),
    );
  }

  @override
  void dispose() {
    _movieDetailBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider<MovieDetailBloc>.value(
        value: _movieDetailBloc,
        child: BlocBuilder<MovieDetailBloc, MovieDetailState>(
          builder: (context, state) {
            if (state is MovieDetailLoaded) {
              final movieDetails = state.movieDetail;
              return Column(
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
                ],
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
