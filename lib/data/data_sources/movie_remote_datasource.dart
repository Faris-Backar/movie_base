import 'dart:developer';
import 'package:movie_base/data/core/api_client.dart';
import 'package:movie_base/data/models/cast_and_crew_model.dart';
import 'package:movie_base/data/models/movie_details_model.dart';
import 'package:movie_base/data/models/movie_model.dart';
import 'package:movie_base/data/models/movie_response_model.dart';
import 'package:movie_base/data/models/video_model.dart';
import 'package:movie_base/data/models/video_result_model.dart';
import 'package:movie_base/domain/entities/cast_entity.dart';

abstract class MovieRemoteDataSource {
  Future<List<MovieModel>> getTrending();
  Future<List<MovieModel>> getPopular();
  Future<List<MovieModel>> getLatest();
  Future<List<MovieModel>> getNowPlaying();
  Future<MovieDetailsModel> getMovieDetails(int id);
  Future<List<CastEntity>> getCastAndCrew(int id);
  Future<List<VideoResultModel>> getVideo(int id);
}

class MovieRemoteDataSourceImpl extends MovieRemoteDataSource {
  final ApiClient _client;
  MovieRemoteDataSourceImpl(this._client);
  @override
  Future<List<MovieModel>> getTrending() async {
    final response = await _client.get(path: 'trending/movie/day');
    final movies = MovieResponseModel.fromJson(response).movieModels;
    log('Trending Movie Response=> $movies');
    return movies;
  }

  @override
  Future<List<MovieModel>> getPopular() async {
    final response = await _client.get(path: 'movie/popular');
    final movies = MovieResponseModel.fromJson(response).movieModels;
    log('Trending Movie Response=> $movies');
    return movies;
  }

  @override
  Future<List<MovieModel>> getLatest() async {
    final response = await _client.get(path: 'movie/latest');
    final movies = MovieResponseModel.fromJson(response).movieModels;
    log('Trending Movie Response=> $movies');
    return movies;
  }

  @override
  Future<List<MovieModel>> getNowPlaying() async {
    final response = await _client.get(path: 'movie/now_playing');
    final movies = MovieResponseModel.fromJson(response).movieModels;
    log('Now Playing Movie Response=> $movies');
    return movies;
  }

  @override
  Future<MovieDetailsModel> getMovieDetails(int id) async {
    final response = await _client.get(path: 'movie/$id');
    final movies = MovieDetailsModel.fromJson(response);
    log('Now Playing Movie Response=> $movies');
    return movies;
  }

  @override
  Future<List<CastEntity>> getCastAndCrew(int id) async {
    final response = await _client.get(path: 'movie/$id/credits');
    final movies = CastAndCrewModel.fromJson(response).cast;
    log('Now Playing Movie Response=> $movies');
    return movies!;
  }

  @override
  Future<List<VideoResultModel>> getVideo(int id) async {
    final response = await _client.get(path: 'movie/$id/videos');
    final movies = VideoModel.fromJson(response).results;
    log('Now Playing Movie Response=> $movies');
    return movies!;
  }
}
