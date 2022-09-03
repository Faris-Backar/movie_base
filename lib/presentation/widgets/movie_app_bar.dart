import 'package:flutter/Material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:movie_base/presentation/blocs/search_movies/search_movies_bloc.dart';
import 'package:movie_base/presentation/screens/search_movie/custom_search_delegate.dart';
import 'package:movie_base/presentation/widgets/logo.dart';
import 'package:sizer/sizer.dart';

class MovieAppBar extends StatelessWidget {
  const MovieAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: MediaQuery.of(context).viewPadding.top,
        left: 16.sp,
        right: 16.sp,
      ),
      child: Row(
        children: [
          IconButton(
            icon: SvgPicture.asset(
              'assets/svgs/menu.svg',
              height: 16.sp,
            ),
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
          ),
          Expanded(
            child: Logo(height: 20.sp),
          ),
          IconButton(
            icon: Icon(
              Icons.search,
              color: Colors.white,
              size: 20.sp,
            ),
            onPressed: () {
              showSearch(
                context: context,
                delegate: CustomSearchDelegate(
                  searchMoviesBloc: BlocProvider.of<SearchMoviesBloc>(context),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
