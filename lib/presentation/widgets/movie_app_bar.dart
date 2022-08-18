import 'package:flutter/Material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:movie_base/presentation/widgets/logo.dart';
import 'package:sizer/sizer.dart';

class MovieAppBar extends StatelessWidget {
  const MovieAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: MediaQuery.of(context).viewPadding.top,
        left: 16.h,
        right: 16.h,
      ),
      child: Row(children: [
        IconButton(
          icon: SvgPicture.asset(
            'assets/svgs/menu.svg',
            height: 12.h,
          ),
          onPressed: () {},
        ),
        Expanded(
          child: Logo(height: 14.h),
        ),
        IconButton(
          icon: Icon(
            Icons.search,
            color: Colors.white,
            size: 12.h,
          ),
          onPressed: () {},
        ),
      ]),
    );
  }
}
