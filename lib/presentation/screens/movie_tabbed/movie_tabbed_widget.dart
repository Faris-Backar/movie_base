import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_base/presentation/blocs/movie_tabbed/movie_tabbed_bloc.dart';
import 'package:movie_base/presentation/screens/movie_tabbed/movie_listview_builder.dart';
import 'package:movie_base/presentation/screens/movie_tabbed/movie_tabbed_constants.dart';
import 'package:movie_base/presentation/screens/movie_tabbed/tab_title_widget.dart';

class MovieTabbedWidget extends StatefulWidget {
  const MovieTabbedWidget({Key? key}) : super(key: key);

  @override
  State<MovieTabbedWidget> createState() => _MovieTabbedWidgetState();
}

class _MovieTabbedWidgetState extends State<MovieTabbedWidget>
    with SingleTickerProviderStateMixin {
  MovieTabbedBloc get movieTabbedbloc =>
      BlocProvider.of<MovieTabbedBloc>(context);
  int currentIndex = 0;

  @override
  void initState() {
    super.initState();
    movieTabbedbloc.add(MovieTabChangedEvent(currentTabIndex: currentIndex));
  }

  @override
  void dispose() {
    super.dispose();
    movieTabbedbloc.close();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MovieTabbedBloc, MovieTabbedState>(
      builder: (context, state) {
        return Column(
          children: [
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                for (var i = 0; i < MovieTabbedConstants.movieTabs.length; i++)
                  TabTitleWidget(
                    title: MovieTabbedConstants.movieTabs[i].title,
                    isSelected: MovieTabbedConstants.movieTabs[i].index ==
                        state.changedTabIndex,
                    ontap: () => _onTabChanged(i),
                  ),
              ],
            ),
            if (state is MovieTabChanged)
              Expanded(
                child: MovieListViewBuilder(movieList: state.movies),
              ),
          ],
        );
      },
    );
  }

  void _onTabChanged(int index) {
    movieTabbedbloc.add(MovieTabChangedEvent(currentTabIndex: index));
  }
}
