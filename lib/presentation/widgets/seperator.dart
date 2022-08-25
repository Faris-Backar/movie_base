import 'package:flutter/material.dart';
import 'package:movie_base/presentation/themes/app_color.dart';
import 'package:sizer/sizer.dart';

class Seperator extends StatelessWidget {
  const Seperator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: .834.sp,
      width: 80.sp,
      padding: EdgeInsets.only(
        top: 2.sp,
        bottom: 6.sp,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.sp),
        gradient: const LinearGradient(
          colors: [
            AppColor.violet,
            AppColor.royalBlue,
          ],
        ),
      ),
    );
  }
}
