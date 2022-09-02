import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:movie_base/data/core/api_constants.dart';
import 'package:movie_base/domain/entities/movie_detail_entity.dart';
import 'package:movie_base/presentation/screens/movie_detail/movie_detailed_appbar.dart';
import 'package:sizer/sizer.dart';
import 'package:movie_base/presentation/themes/theme_text.dart';
import 'package:movie_base/common/extension/num_extension.dart';

class BigPoster extends StatelessWidget {
  final MovieDetailEntity movie;
  const BigPoster({
    Key? key,
    required this.movie,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          foregroundDecoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Theme.of(context).primaryColor.withOpacity(0.3),
                Theme.of(context).primaryColor
              ],
            ),
          ),
          child: CachedNetworkImage(
            imageUrl: '${ApiConstants.BASE_IMAGE_URL}${movie.posterPath}',
            width: 100.w,
          ),
        ),
        Positioned(
          left: 0,
          right: 0,
          bottom: 0,
          child: ListTile(
            title: Text(
              movie.title,
              style: Theme.of(context).textTheme.headline6,
            ),
            subtitle: Text(
              DateFormat('dd-MM-yyyy').format(movie.releaseDate!),
              style: Theme.of(context).textTheme.greySubtitle1,
            ),
            trailing: Text(
              movie.voteAvarage.covertToPercentageString(),
              style: Theme.of(context).textTheme.violetHeadLine1,
            ),
          ),
        ),
        Positioned(
          left: 5.w,
          right: 5.w,
          top: MediaQuery.of(context).viewPadding.top + 3.h,
          child: const MovieDetailedAppBar(),
        )
      ],
    );
  }
}
