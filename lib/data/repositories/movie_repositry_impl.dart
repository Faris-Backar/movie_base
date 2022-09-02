import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:movie_base/data/data_sources/movie_remote_datasource.dart';
import 'package:movie_base/domain/entities/app_error.dart';
import 'package:movie_base/domain/entities/cast_entity.dart';
import 'package:movie_base/domain/entities/movie_detail_entity.dart';
import 'package:movie_base/domain/entities/movie_entities.dart';
import 'package:movie_base/domain/entities/video_entity.dart';
import 'package:movie_base/domain/repositories/movie_repostiry.dart';

class MovieRepositryImpl extends MovieRepositry {
  final MovieRemoteDataSource remoteDataSource;
  MovieRepositryImpl({required this.remoteDataSource});

  @override
  Future<Either<AppError, List<MovieEntities>>> getTrending() async {
    try {
      final movies = await remoteDataSource.getTrending();
      return Right(movies);
    } on SocketException {
      return const Left(
        AppError(appErrorType: AppErrorType.network),
      );
    } on Exception {
      return const Left(
        AppError(appErrorType: AppErrorType.api),
      );
    }
  }

  @override
  Future<Either<AppError, List<MovieEntities>>> getLatest() async {
    try {
      final movies = await remoteDataSource.getLatest();
      return Right(movies);
    } on SocketException {
      return const Left(
        AppError(appErrorType: AppErrorType.network),
      );
    } on Exception {
      return const Left(
        AppError(appErrorType: AppErrorType.api),
      );
    }
  }

  @override
  Future<Either<AppError, List<MovieEntities>>> getNowPlaying() async {
    try {
      final movies = await remoteDataSource.getNowPlaying();
      return Right(movies);
    } on SocketException {
      return const Left(
        AppError(appErrorType: AppErrorType.network),
      );
    } on Exception {
      return const Left(
        AppError(appErrorType: AppErrorType.api),
      );
    }
  }

  @override
  Future<Either<AppError, List<MovieEntities>>> getPopular() async {
    try {
      final movies = await remoteDataSource.getPopular();
      return Right(movies);
    } on SocketException {
      return const Left(
        AppError(appErrorType: AppErrorType.network),
      );
    } on Exception {
      return const Left(
        AppError(appErrorType: AppErrorType.api),
      );
    }
  }

  @override
  Future<Either<AppError, MovieDetailEntity>> getMovieDetail(int id) async {
    try {
      final movies = await remoteDataSource.getMovieDetails(id);
      return Right(movies);
    } on SocketException {
      return const Left(
        AppError(appErrorType: AppErrorType.network),
      );
    } on Exception {
      return const Left(
        AppError(appErrorType: AppErrorType.api),
      );
    }
  }

  @override
  Future<Either<AppError, List<CastEntity>>> getCastCrew(int id) async {
    try {
      final movies = await remoteDataSource.getCastAndCrew(id);
      return Right(movies);
    } on SocketException {
      return const Left(
        AppError(appErrorType: AppErrorType.network),
      );
    } on Exception {
      return const Left(
        AppError(appErrorType: AppErrorType.api),
      );
    }
  }

  @override
  Future<Either<AppError, List<VideoEntity>>> getVideos(int id) async {
    try {
      final movies = await remoteDataSource.getVideo(id);
      return Right(movies);
    } on SocketException {
      return const Left(
        AppError(appErrorType: AppErrorType.network),
      );
    } on Exception {
      return const Left(
        AppError(appErrorType: AppErrorType.api),
      );
    }
  }
}
