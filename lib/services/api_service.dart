import 'dart:developer';
import 'package:api_project/model/movie_model.dart';
import 'package:api_project/services/utils.dart';
import 'package:dio/dio.dart';

class ApiServices {
  final Dio dio = Dio();

  Future<List<MovieModel>> nowPlaying() async {
    try {
      final response = await dio.get(Urls.nowPlaying);
      if (response.statusCode == 200) {
        log(
          "Now playing movies fetched: ${response.data['results'].length} items",
        );
        List data = response.data['results'];
        return data.map((e) => MovieModel.fromJSon(e)).toList();
      }
      throw Exception("Failed with status : ${response.statusCode}");
    } catch (e) {
      log("Error fetching the data: $e");
      throw [];
    }
  }

  Future<List<MovieModel>> trendingMovies() async {
    try {
      final response = await dio.get(Urls.baseUrl);
      if (response.statusCode == 200) {
        log(
          "Trending movies fetched: ${response.data['results'].length} items",
        );
        List data = response.data['results'];
        return data.map((e) => MovieModel.fromJSon(e)).toList();
      }
      throw Exception("Failed with status : ${response.statusCode}");
    } catch (e) {
      log("Error fetching the data: $e");
      throw [];
    }
  }

  Future<List<MovieModel>> topRatedSer() async {
    try {
      final response = await dio.get(Urls.toprated);
      if (response.statusCode == 200) {
        log(
          "Top Rated movies fetched: ${response.data['results'].length} items",
        );
        List data = response.data['results'];
        return data.map((e) => MovieModel.fromJSon(e)).toList();
      }
      throw Exception("Failed with status : ${response.statusCode}");
    } catch (e) {
      log("Error fetching the data: $e");
      throw [];
    }
  }

  Future<List<MovieModel>> upcomingMoviesSer() async {
    try {
      final response = await dio.get(Urls.upcomings);
      if (response.statusCode == 200) {
        log(
          "Upcoming movies fetched: ${response.data['results'].length} items",
        );
        List data = response.data['results'];
        return data.map((e) => MovieModel.fromJSon(e)).toList();
      }
      throw Exception("Failed with status : ${response.statusCode}");
    } catch (e) {
      log("Error fetching the data: $e");
      throw [];
    }
  }

  Future<List<MovieModel>> tvShowsSer() async {
    try {
      final response = await dio.get(Urls.tvshows);
      if (response.statusCode == 200) {
        log("TV shows fetched: ${response.data['results'].length} items");
        List data = response.data['results'];
        return data.map((e) => MovieModel.fromJSon(e)).toList();
      }
      throw Exception("Failed with status : ${response.statusCode}");
    } catch (e) {
      log("Error fetching the data: $e");
      throw [];
    }
  }

  Future<List<MovieModel>> movieSearh({required String movies}) async {
    final searchUrl = "${Urls.search}$movies";
    try {
      final response = await dio.get(searchUrl);
      if (response.statusCode == 200) {
        log("Search results fetched: ${response.data['results'].length} items");
        log(response.data.toString());
        List data = response.data['results'];
        return data.map((e) => MovieModel.fromJSon(e)).toList();
      }
      throw Exception("Failed with status. ${response.statusCode}");
    } catch (e) {
      log("Error fetching the results: $e");
      throw Exception(e);
    }
  }
}
