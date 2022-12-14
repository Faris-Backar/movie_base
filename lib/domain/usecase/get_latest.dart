// ignore_for_file: avoid_renaming_method_parameters

import 'package:dartz/dartz.dart';
import 'package:movie_base/domain/entities/app_error.dart';
import 'package:movie_base/domain/entities/movie_entities.dart';
import 'package:movie_base/domain/entities/no_params.dart';
import 'package:movie_base/domain/repositories/movie_repostiry.dart';
import 'package:movie_base/domain/usecase/usecase.dart';

class GetLatest extends UseCase<List<MovieEntities>, NoParams> {
  final MovieRepositry repositry;
  GetLatest({required this.repositry});
  @override
  Future<Either<AppError, List<MovieEntities>>> call(NoParams noParams) async {
    return await repositry.getLatest();
  }
}
