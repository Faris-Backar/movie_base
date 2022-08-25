import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:movie_base/presentation/screens/movieCarousal/movie_card_widget.dart';

class AnimatedMovieWidgetCard extends StatelessWidget {
  final int index;
  final int movieId;
  final String posterpath;
  final PageController pageController;
  const AnimatedMovieWidgetCard({
    Key? key,
    required this.index,
    required this.movieId,
    required this.posterpath,
    required this.pageController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: pageController,
      builder: (context, child) {
        double value = 1;
        if (pageController.hasClients) {
          if (pageController.position.haveDimensions) {
            value = pageController.page! - index;
            value = (1 - (value.abs()) * .1).clamp(0.0, 1.0);
            return Align(
              alignment: Alignment.topCenter,
              child: SizedBox(
                height: Curves.easeIn.transform(value) * 80.h,
                width: 30.w,
                child: child,
              ),
            );
          }
        } else {
          return Align(
            alignment: Alignment.topCenter,
            child: SizedBox(
              height:
                  Curves.easeIn.transform(index == 0 ? value : value * 0.5) *
                      140.h,
              width: 80.w,
              child: child,
            ),
          );
        }
        return Align(
          alignment: Alignment.topCenter,
          child: SizedBox(
            height: Curves.easeIn.transform(index == 0 ? value : value * 0.5) *
                150.h,
            width: 80.w,
            child: child,
          ),
        );
      },
      child: MovieCardWidget(movieId: movieId, posterPath: posterpath),
    );
  }
}
