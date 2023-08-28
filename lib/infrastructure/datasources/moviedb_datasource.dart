

import 'package:cinemapedia/config/constants/environtment.dart';
import 'package:cinemapedia/infrastructure/mappers/movie_mapper.dart';
import 'package:cinemapedia/infrastructure/models/moviedb/moviedb_response.dart';
import 'package:dio/dio.dart';
import 'package:cinemapedia/domain/entities/movie.dart';

import '../../domain/datasources/movies_datasources.dart';

class MoviedbDatasource extends MoviesDatasource{
  @override
  final dio  = Dio(BaseOptions(
    baseUrl: 'https://api.themoviedb.org/3',
    queryParameters: {
      'api_key': Envnironment.theMovieDBKey,
      'language': 'es-MX'
    }
  
  ));
  @override
  Future<List<Movie>> getNowPlaying({int page = 1}) async{
     
    final response = await dio.get('/movie/now_playing');
    final movieDBResponse = MovieDbResponse.fromJson(response.data);
    final List<Movie> movie = movieDBResponse.results
    .where((moviedb) => moviedb.posterPath != 'no-poster')
    .map(
      (moviedb) => MovieMapper.movieDBToEntity(moviedb)).toList();
    
    return movie;
  }

}