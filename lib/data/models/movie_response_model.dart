import 'dart:developer';

import 'package:movie_base/data/models/movie_model.dart';

class MovieResponseModel {
  MovieResponseModel({
    required this.movieModels,
  });

  List<MovieModel> movieModels;

  factory MovieResponseModel.fromJson(Map<String, dynamic> json) {
    log('json =>$json');
    return MovieResponseModel(
      movieModels: List<MovieModel>.from(
          json["results"].map((x) => MovieModel.fromJson(x))),
    );
  }
  Map<String, dynamic> toJson() => {
        "results": List<dynamic>.from(movieModels.map((x) => x.toJson())),
      };
}
