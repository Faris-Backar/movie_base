import 'package:flutter/material.dart';
import 'package:movie_base/presentation/themes/app_color.dart';
import 'package:sizer/sizer.dart';

class TabTitleWidget extends StatelessWidget {
  final String title;
  final Function()? ontap;
  final bool isSelected;
  const TabTitleWidget({
    Key? key,
    required this.title,
    this.ontap,
    required this.isSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.transparent,
          border: Border(
            bottom: BorderSide(
              color: isSelected ? AppColor.royalBlue : Colors.transparent,
              width: .834.sp,
            ),
          ),
        ),
        child: Text(title,
            style: isSelected
                ? const TextStyle(
                    color: AppColor.royalBlue,
                    fontWeight: FontWeight.w600,
                  )
                : Theme.of(context).textTheme.subtitle1),
      ),
    );
  }
}
