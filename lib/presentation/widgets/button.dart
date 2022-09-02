import 'package:flutter/material.dart';
import 'package:movie_base/presentation/themes/app_color.dart';
import 'package:sizer/sizer.dart';

class Button extends StatelessWidget {
  final String title;
  final Function()? ontap;
  const Button({
    Key? key,
    required this.title,
    this.ontap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        gradient: const LinearGradient(
          colors: [
            AppColor.royalBlue,
            AppColor.violet,
          ],
        ),
      ),
      padding: EdgeInsets.symmetric(horizontal: 5.w),
      margin: EdgeInsets.symmetric(vertical: 5.w),
      height: 7.h,
      child: TextButton(
        onPressed: ontap,
        child: Text(title, style: Theme.of(context).textTheme.button),
      ),
    );
  }
}
