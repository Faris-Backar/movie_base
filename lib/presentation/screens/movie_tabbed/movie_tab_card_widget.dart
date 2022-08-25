import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movie_base/data/core/api_constants.dart';
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
        ClipRRect(
          borderRadius: BorderRadius.circular(16.sp),
          child: CachedNetworkImage(
            imageUrl: '${ApiConstants.BASE_IMAGE_URL}$posterPath',
            fit: BoxFit.cover,
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
