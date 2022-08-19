import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_base/di/get_it.dart';
import 'package:movie_base/presentation/blocs/movie_carousal/movie_carousal_bloc.dart';
import 'package:movie_base/presentation/screens/movieCarousal/movie_carousal_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late MovieCarousalBloc movieCarousalBloc;
  @override
  void initState() {
    super.initState();
    movieCarousalBloc = getItInstance<MovieCarousalBloc>();
    movieCarousalBloc.add(const CarousalLoadEvent());
  }

  @override
  void dispose() {
    super.dispose();
    movieCarousalBloc.close();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<MovieCarousalBloc>(
      create: (context) => movieCarousalBloc,
      child: BlocBuilder<MovieCarousalBloc, MovieCarousalState>(
        bloc: movieCarousalBloc,
        builder: (context, state) {
          log(state.toString());
          if (state is MovieCarousalLoaded) {
            log('here in movieCarousalLoaded');
            return Scaffold(
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
                  // const FractionallySizedBox(
                  //   alignment: Alignment.bottomCenter,
                  //   heightFactor: 0.4,
                  //   child: Placeholder(
                  //     color: Colors.white,
                  //   ),
                  // )
                ],
              ),
            );
          }
          if (state is MovieCarousalInitial) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }
}
