import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_base/presentation/blocs/search_movies/search_movies_bloc.dart';
import 'package:movie_base/presentation/screens/search_movie/search_movie_card.dart';
import 'package:movie_base/presentation/themes/app_color.dart';
import 'package:movie_base/presentation/themes/theme_text.dart';
import 'package:sizer/sizer.dart';

class CustomSearchDelegate extends SearchDelegate {
  final SearchMoviesBloc searchMoviesBloc;
  CustomSearchDelegate({
    required this.searchMoviesBloc,
  });

  @override
  ThemeData appBarTheme(BuildContext context) {
    return Theme.of(context).copyWith(
      appBarTheme: const AppBarTheme(
        backgroundColor: AppColor.vulcan,
      ),
      colorScheme: ColorScheme.fromSwatch().copyWith(
        primary: AppColor.royalBlue,
      ),
      inputDecorationTheme: InputDecorationTheme(
        hintStyle: Theme.of(context).textTheme.greySubtitle1,
      ),
    );
  }

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: query.isEmpty ? null : () => query = '',
        icon: Icon(
          Icons.clear_rounded,
          color: query.isEmpty ? Colors.grey : AppColor.royalBlue,
        ),
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return GestureDetector(
      onTap: () {
        close(context, null);
      },
      child: Icon(
        Icons.arrow_back_ios_new_rounded,
        color: Colors.white,
        size: 22.sp,
      ),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    searchMoviesBloc.add(
      GetSearchMovieEvent(searchMovies: query),
    );
    return BlocBuilder<SearchMoviesBloc, SearchMoviesState>(
      builder: (context, state) {
        if (state is SearchMoviesError) {
          return Container();
        } else if (state is SearchMoviesLoaded) {
          final movie = state.movies;
          if (movie.isEmpty) {
            return Center(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 5.w),
                child: const Text(
                  "No movies Found",
                  textAlign: TextAlign.center,
                ),
              ),
            );
          }
          return ListView.builder(
            itemCount: movie.length,
            scrollDirection: Axis.vertical,
            itemBuilder: (context, index) => SearchMovieCard(
              movieEntities: movie[index],
            ),
          );
        } else {}
        return SizedBox.shrink();
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return SizedBox.shrink();
  }
}
