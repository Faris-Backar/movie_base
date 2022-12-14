import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_base/domain/entities/movie_entities.dart';
import 'package:movie_base/presentation/blocs/movie_backdrop/movie_backdrop_bloc.dart';
import 'package:movie_base/presentation/screens/movieCarousal/animated_movie_widget_card.dart';
import 'package:sizer/sizer.dart';

class MoviePageView extends StatefulWidget {
  final List<MovieEntities> movies;
  final int initialPage;
  const MoviePageView(
      {Key? key, required this.initialPage, required this.movies})
      : super(key: key);

  @override
  State<MoviePageView> createState() => _MoviePageViewState();
}

class _MoviePageViewState extends State<MoviePageView> {
  late PageController pageController;
  @override
  void initState() {
    super.initState();
    BlocProvider.of<MovieBackdropBloc>(context)
        .add(MovieBackDropChangedEvent(movie: widget.movies[0]));
    pageController = PageController(
        initialPage: widget.initialPage,
        keepPage: false,
        viewportFraction: 0.7);
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        vertical: 10.sp,
      ),
      height: 40.h,
      child: PageView.builder(
        itemBuilder: (context, index) {
          final MovieEntities movies = widget.movies[index];
          return AnimatedMovieWidgetCard(
            movieId: movies.id!,
            posterpath: movies.posterPath!,
            pageController: pageController,
            index: index,
          );
        },
        pageSnapping: true,
        itemCount: widget.movies.length,
        onPageChanged: (index) {
          BlocProvider.of<MovieBackdropBloc>(context)
              .add(MovieBackDropChangedEvent(movie: widget.movies[index]));
        },
      ),
    );
  }
}
