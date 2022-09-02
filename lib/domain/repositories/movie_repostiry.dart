import 'package:dartz/dartz.dart';
import 'package:movie_base/domain/entities/app_error.dart';
import 'package:movie_base/domain/entities/movie_detail_entity.dart';
import 'package:movie_base/domain/entities/movie_entities.dart';

abstract class MovieRepositry {
  Future<Either<AppError, List<MovieEntities>>> getTrending();
  Future<Either<AppError, List<MovieEntities>>> getLatest();
  Future<Either<AppError, List<MovieEntities>>> getNowPlaying();
  Future<Either<AppError, List<MovieEntities>>> getPopular();
  Future<Either<AppError, MovieDetailEntity>> getMovieDetail(int id);
}
