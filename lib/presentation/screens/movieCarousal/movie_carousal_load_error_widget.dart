import 'package:flutter/material.dart';

import 'package:movie_base/domain/entities/app_error.dart';
import 'package:movie_base/presentation/blocs/movie_carousal/movie_carousal_bloc.dart';

class MovieCarousalLoadErrorWidget extends StatelessWidget {
  final AppErrorType appErrorType;
  final MovieCarousalBloc bloc;
  const MovieCarousalLoadErrorWidget({
    Key? key,
    required this.appErrorType,
    required this.bloc,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            appErrorType == AppErrorType.api
                ? 'Something went Wrong'
                : 'Please check Network and try again',
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.subtitle1,
          ),
          ButtonBar(
            children: [
              MaterialButton(
                onPressed: () => bloc.add(
                  const CarousalLoadEvent(),
                ),
                child: const Text('Retry'),
              ),
              MaterialButton(
                onPressed: () => bloc.add(
                  const CarousalLoadEvent(),
                ),
                child: const Text('feedback'),
              ),
            ],
          )
        ],
      ),
    );
  }
}
