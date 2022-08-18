import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movie_base/data/core/api_constants.dart';
import 'package:sizer/sizer.dart';

class MovieCardWidget extends StatelessWidget {
  final int movieId;
  final String posterPath;

  const MovieCardWidget(
      {Key? key, required this.movieId, required this.posterPath})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 32,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16.w),
        child: CachedNetworkImage(
          imageUrl: '${ApiConstants.BASE_URL}$posterPath',
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
