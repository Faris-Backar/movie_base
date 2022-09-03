import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movie_base/data/core/api_constants.dart';
import 'package:movie_base/domain/entities/movie_entities.dart';
import 'package:movie_base/presentation/screens/movie_detail/movie_detail_argument.dart';
import 'package:movie_base/presentation/screens/movie_detail/movie_detail_screen.dart';
import 'package:sizer/sizer.dart';
import 'package:movie_base/presentation/themes/theme_text.dart';

class SearchMovieCard extends StatelessWidget {
  final MovieEntities movieEntities;

  const SearchMovieCard({
    Key? key,
    required this.movieEntities,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => MovieDetailScreen(
              movieDetailArguments:
                  MovieDetailArguments(movieId: movieEntities.id!),
            ),
          ),
        );
      },
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 16.w,
          vertical: 2.h,
        ),
        child: Row(
          children: [
            Padding(
              padding: EdgeInsets.all(8.w),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(4.w),
                child: CachedNetworkImage(
                  imageUrl:
                      '${ApiConstants.BASE_IMAGE_URL}${movieEntities.posterPath}',
                  width: 30.w,
                ),
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Text(
                    movieEntities.title!,
                    style: Theme.of(context).textTheme.subtitle1,
                  ),
                  Text(
                    movieEntities.overview!,
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.greyCaption,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
