import 'package:flutter/material.dart';
import 'package:movie_base/domain/entities/movie_entities.dart';
import 'package:movie_base/presentation/screens/movieCarousal/movie_backdrop_widget.dart';
import 'package:movie_base/presentation/screens/movieCarousal/movie_page_view.dart';
import 'package:movie_base/presentation/widgets/movie_app_bar.dart';

class MovieCarousalWidget extends StatelessWidget {
  final List<MovieEntities> movies;
  final int defaultIndex;
  const MovieCarousalWidget(
      {Key? key, required this.defaultIndex, required this.movies})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        const MovieBackDropWidget(),
        Column(
          children: [
            const MovieAppBar(),
            MoviePageView(
              movies: movies,
              initialPage: defaultIndex,
            ),
          ],
        ),
      ],
    );
  }
}
