import 'dart:developer';

import 'package:movie_base/data/core/api_client.dart';
import 'package:movie_base/data/models/movie_model.dart';
import 'package:movie_base/data/models/movie_response_model.dart';

abstract class MovieRemoteDataSource {
  Future<List<MovieModel>> getTrending();
  Future<List<MovieModel>> getPopular();
  Future<List<MovieModel>> getLatest();
  Future<List<MovieModel>> getNowPlaying();
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
}
