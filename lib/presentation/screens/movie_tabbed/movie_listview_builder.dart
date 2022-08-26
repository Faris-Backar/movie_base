import 'package:flutter/material.dart';

import 'package:movie_base/domain/entities/movie_entities.dart';
import 'package:movie_base/presentation/screens/movie_tabbed/movie_tab_card_widget.dart';
import 'package:sizer/sizer.dart';

class MovieListViewBuilder extends StatelessWidget {
  final List<MovieEntities> movieList;
  const MovieListViewBuilder({
    Key? key,
    required this.movieList,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 2.h),
      child: ListView.separated(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            final MovieEntities movie = movieList[index];
            return MovieTabCardWidget(
                movieId: movie.id,
                title: movie.title!,
                posterPath: movie.posterPath);
          },
          separatorBuilder: (context, index) => SizedBox(
                width: 4.w,
              ),
          itemCount: movieList.length),
    );
  }
}
