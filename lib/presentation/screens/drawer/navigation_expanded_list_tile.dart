import 'package:flutter/material.dart';
import 'package:movie_base/presentation/screens/drawer/navigation_list_item.dart';
import 'package:sizer/sizer.dart';

class NavigationExpansionTileWidget extends StatelessWidget {
  final String title;
  final Function()? onPressed;
  final List<String> children;
  const NavigationExpansionTileWidget({
    Key? key,
    required this.title,
    required this.onPressed,
    required this.children,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Theme.of(context).primaryColor.withOpacity(0.7),
              blurRadius: 2,
            )
          ],
        ),
        child: ExpansionTile(
          title: Text(
            title,
            style: Theme.of(context).textTheme.subtitle1,
          ),
          children: [
            for (int i = 0; i < children.length; i++)
              Padding(
                padding: EdgeInsets.only(left: 12.sp),
                child: NavigationListItem(title: children[i], onPressed: () {}),
              )
          ],
        ),
      ),
    );
  }
}
