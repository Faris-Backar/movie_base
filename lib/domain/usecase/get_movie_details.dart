// ignore_for_file: avoid_renaming_method_parameters

import 'package:dartz/dartz.dart';
import 'package:movie_base/domain/entities/app_error.dart';
import 'package:movie_base/domain/entities/movie_detail_entity.dart';
import 'package:movie_base/domain/entities/movie_entities.dart';
import 'package:movie_base/domain/entities/movie_params.dart';
import 'package:movie_base/domain/entities/no_params.dart';
import 'package:movie_base/domain/repositories/movie_repostiry.dart';
import 'package:movie_base/domain/usecase/usecase.dart';

class GetMovieDetails extends UseCase<MovieDetailEntity, MovieParams> {
  final MovieRepositry repositry;
  GetMovieDetails({required this.repositry});
  @override
  Future<Either<AppError, MovieDetailEntity>> call(
      MovieParams movieParams) async {
    return await repositry.getMovieDetail(movieParams.id);
  }
}
