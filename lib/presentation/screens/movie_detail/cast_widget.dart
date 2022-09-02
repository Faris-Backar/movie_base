import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_base/data/core/api_constants.dart';
import 'package:movie_base/presentation/blocs/cast_and_crew/cast_and_crew_bloc.dart';
import 'package:sizer/sizer.dart';
import 'package:movie_base/presentation/themes/theme_text.dart';

class CastWidget extends StatelessWidget {
  const CastWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CastAndCrewBloc, CastAndCrewState>(
      builder: (context, state) {
        if (state is CastAndCrewLoaded) {
          return SizedBox(
            height: 35.h,
            child: ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: state.casts.length,
              itemBuilder: (context, index) {
                final cast = state.casts[index];
                return SizedBox(
                  height: 10.h,
                  width: 30.h,
                  child: Card(
                    elevation: 1,
                    margin: EdgeInsets.symmetric(
                      horizontal: 2.w,
                      vertical: 2.w,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(
                          2.w,
                        ),
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: ClipRRect(
                            borderRadius: BorderRadius.vertical(
                              top: Radius.circular(2.w),
                            ),
                            child: cast.posterId != null
                                ? CachedNetworkImage(
                                    height: 10.h,
                                    width: 100.w,
                                    fit: BoxFit.fitWidth,
                                    imageUrl:
                                        '${ApiConstants.BASE_IMAGE_URL}${cast.posterId}',
                                  )
                                : Image.asset(
                                    'assets/pngs/default_avatar.jpg',
                                    height: 10.h,
                                    width: 100.w,
                                    fit: BoxFit.fitWidth,
                                  ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: 2.w,
                          ),
                          child: Text(
                            cast.name!,
                            overflow: TextOverflow.fade,
                            maxLines: 1,
                            style: Theme.of(context).textTheme.vulcanBodyText2,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              left: 3.w, right: 2.w, bottom: 3.w),
                          child: Text(
                            cast.character!,
                            overflow: TextOverflow.fade,
                            maxLines: 1,
                            style: Theme.of(context).textTheme.caption,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          );
        }
        return const SizedBox.shrink();
      },
    );
  }
}
