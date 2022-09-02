import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class MovieDetailedAppBar extends StatelessWidget {
  const MovieDetailedAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
          onTap: () => Navigator.of(context).pop(),
          child: Icon(
            Icons.arrow_back_ios_new_rounded,
            color: Colors.white,
            size: 22.sp,
          ),
        ),
        Icon(
          Icons.favorite_border_rounded,
          color: Colors.white,
          size: 22.sp,
        ),
      ],
    );
  }
}
