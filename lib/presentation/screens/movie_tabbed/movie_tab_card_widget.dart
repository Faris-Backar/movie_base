import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movie_base/data/core/api_constants.dart';
import 'package:movie_base/presentation/screens/movie_detail/movie_detail_argument.dart';
import 'package:movie_base/presentation/screens/movie_detail/movie_detail_screen.dart';
import 'package:sizer/sizer.dart';
import 'package:movie_base/common/extension/string_extension.dart';

class MovieTabCardWidget extends StatelessWidget {
  final int movieId;
  final String title;
  final String posterPath;
  const MovieTabCardWidget({
    Key? key,
    required this.movieId,
    required this.title,
    required this.posterPath,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: () => Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => MovieDetailScreen(
                movieDetailArguments: MovieDetailArguments(
                  movieId: movieId,
                ),
              ),
            ),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(13.34.sp),
            child: SizedBox(
              width: 60.w,
              height: 30.h,
              child: CachedNetworkImage(
                imageUrl: '${ApiConstants.BASE_IMAGE_URL}$posterPath',
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: 4.sp),
          child: Text(
            title.intelliTrim(),
            maxLines: 1,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodyText2,
          ),
        ),
      ],
    );
  }
}
