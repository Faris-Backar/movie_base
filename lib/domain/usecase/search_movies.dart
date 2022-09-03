// ignore_for_file: avoid_renaming_method_parameters

import 'package:dartz/dartz.dart';
import 'package:movie_base/domain/entities/app_error.dart';
import 'package:movie_base/domain/entities/movie_entities.dart';
import 'package:movie_base/domain/entities/search_movie_params.dart';
import 'package:movie_base/domain/repositories/movie_repostiry.dart';
import 'package:movie_base/domain/usecase/usecase.dart';

class GetSearchmovies extends UseCase<List<MovieEntities>, SearchMovieParams> {
  final MovieRepositry repositry;
  GetSearchmovies({required this.repositry});
  @override
  Future<Either<AppError, List<MovieEntities>>> call(
      SearchMovieParams movieParams) async {
    return await repositry.getSearchedMovies(movieParams.searchTerm);
  }
}
