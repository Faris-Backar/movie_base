import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_base/di/get_it.dart';
import 'package:movie_base/presentation/blocs/movie_backdrop/movie_backdrop_bloc.dart';
import 'package:movie_base/presentation/blocs/movie_carousal/movie_carousal_bloc.dart';
import 'package:movie_base/presentation/blocs/movie_tabbed/movie_tabbed_bloc.dart';
import 'package:movie_base/presentation/screens/drawer/navigation_drawer.dart';
import 'package:movie_base/presentation/screens/movieCarousal/movie_carousal_load_error_widget.dart';
import 'package:movie_base/presentation/screens/movieCarousal/movie_carousal_widget.dart';
import 'package:movie_base/presentation/screens/movie_tabbed/movie_tabbed_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late MovieCarousalBloc movieCarousalBloc;
  late MovieBackdropBloc movieBackdropBloc;
  late MovieTabbedBloc movieTabbedBloc;
  @override
  void initState() {
    super.initState();
    movieCarousalBloc = getItInstance<MovieCarousalBloc>();
    movieBackdropBloc = getItInstance<MovieBackdropBloc>();
    movieTabbedBloc = getItInstance<MovieTabbedBloc>();
    movieCarousalBloc.add(const CarousalLoadEvent());
  }

  @override
  void dispose() {
    super.dispose();
    movieCarousalBloc.close();
    movieBackdropBloc.close();
    movieTabbedBloc.close();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<MovieCarousalBloc>(
          create: (context) => movieCarousalBloc,
        ),
        BlocProvider<MovieBackdropBloc>(
          create: (context) => movieBackdropBloc,
        ),
        BlocProvider<MovieTabbedBloc>(
          create: (context) => movieTabbedBloc,
        ),
      ],
      child: BlocBuilder<MovieCarousalBloc, MovieCarousalState>(
        bloc: movieCarousalBloc,
        builder: (context, state) {
          log(state.toString());
          if (state is MovieCarousalLoaded) {
            log('here in movieCarousalLoaded');
            return Scaffold(
              drawer: const NavigationDrawer(),
              body: Stack(
                fit: StackFit.expand,
                children: [
                  FractionallySizedBox(
                    alignment: Alignment.topCenter,
                    heightFactor: 0.6,
                    child: MovieCarousalWidget(
                      movies: state.movies,
                      defaultIndex: state.defaultIndex ?? 0,
                    ),
                  ),
                  const FractionallySizedBox(
                    alignment: Alignment.bottomCenter,
                    heightFactor: 0.4,
                    child: MovieTabbedWidget(),
                  )
                ],
              ),
            );
          }
          if (state is MovieCarousalInitial) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is MovieCarousalErrror) {
            return MovieCarousalLoadErrorWidget(
              appErrorType: state.appErrorType,
              bloc: movieCarousalBloc,
            );
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }
}
