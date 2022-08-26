import 'package:flutter/material.dart';
import 'package:movie_base/presentation/screens/drawer/navigation_expanded_list_tile.dart';
import 'package:movie_base/presentation/screens/drawer/navigation_list_item.dart';
import 'package:movie_base/presentation/widgets/logo.dart';
import 'package:sizer/sizer.dart';

class NavigationDrawer extends StatelessWidget {
  const NavigationDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 70.w,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Theme.of(context).primaryColor.withOpacity(0.7),
              blurRadius: 4,
            )
          ],
        ),
        child: SafeArea(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.only(
                top: 15.sp,
                bottom: 25.sp,
                left: 15.sp,
                right: 15.sp,
              ),
              child: Logo(
                height: 20.sp,
              ),
            ),
            NavigationListItem(
              title: 'Favourite Movies',
              onPressed: () {},
            ),
            NavigationExpansionTileWidget(
                title: 'Language',
                onPressed: () {},
                children: const [
                  'English',
                  'Spanish',
                ]),
            NavigationListItem(
              title: 'Feedback',
              onPressed: () {},
            ),
            NavigationListItem(
              title: 'About',
              onPressed: () {},
            ),
          ],
        )));
  }
}
