import 'package:get_it/get_it.dart';
import 'package:http/http.dart';
import 'package:movie_base/data/core/api_client.dart';
import 'package:movie_base/data/data_sources/movie_remote_datasource.dart';
import 'package:movie_base/data/repositories/movie_repositry_impl.dart';
import 'package:movie_base/domain/repositories/movie_repostiry.dart';
import 'package:movie_base/domain/usecase/get_latest.dart';
import 'package:movie_base/domain/usecase/get_now_playing.dart';
import 'package:movie_base/domain/usecase/get_popular.dart';
import 'package:movie_base/domain/usecase/get_trending.dart';
import 'package:movie_base/presentation/blocs/movie_backdrop/movie_backdrop_bloc.dart';
import 'package:movie_base/presentation/blocs/movie_carousal/movie_carousal_bloc.dart';
import 'package:movie_base/presentation/blocs/movie_tabbed/movie_tabbed_bloc.dart';

final getItInstance = GetIt.I;
Future init() async {
  getItInstance.registerLazySingleton<Client>(() => Client());
  getItInstance
      .registerLazySingleton<ApiClient>(() => ApiClient(getItInstance()));
  getItInstance.registerLazySingleton<MovieRemoteDataSource>(
      () => MovieRemoteDataSourceImpl(getItInstance()));
  getItInstance.registerLazySingleton<GetTrending>(
      () => GetTrending(repositry: getItInstance()));

  getItInstance.registerLazySingleton<GetLatest>(
      () => GetLatest(repositry: getItInstance()));

  getItInstance.registerLazySingleton<GetNowPlaying>(
      () => GetNowPlaying(repositry: getItInstance()));

  getItInstance.registerLazySingleton<GetPopular>(
      () => GetPopular(repositry: getItInstance()));
  getItInstance.registerLazySingleton<MovieRepositry>(
      () => MovieRepositryImpl(remoteDataSource: getItInstance()));
  getItInstance
      .registerFactory(() => MovieCarousalBloc(getTrending: getItInstance()));

  getItInstance.registerFactory(() => MovieBackdropBloc());
  getItInstance.registerFactory(
    () => MovieTabbedBloc(
      getLatest: GetLatest(
        repositry: getItInstance(),
      ),
      getNowPlaying: GetNowPlaying(
        repositry: getItInstance(),
      ),
      getTrending: GetTrending(
        repositry: getItInstance(),
      ),
      getpopular: GetPopular(
        repositry: getItInstance(),
      ),
    ),
  );
}
