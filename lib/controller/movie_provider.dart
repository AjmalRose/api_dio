import 'dart:developer';
import 'package:api_project/model/movie_model.dart';
import 'package:api_project/services/api_service.dart';
import 'package:flutter/material.dart';


class MovieController extends ChangeNotifier{
  String imagePath = "https://image.tmdb.org/t/p/w400/";
  ApiServices apiServices = ApiServices();
  List<MovieModel> movies = [];
  List<MovieModel> nowPlaying = [];
  List<MovieModel> topRated = [];
  List<MovieModel> upcoming = [];
  List<MovieModel> tvShow = [];
  List<MovieModel> searchList = [];
  TextEditingController searchController = TextEditingController();
  bool isLoading = false;


  MovieController(){
    getAllMovies();
  }

  Future<void> getAllMovies() async{
    isLoading = true;
    notifyListeners();
    try{
      movies = await apiServices.trendingMovies();
      log("Trending movies loaded: ${movies.length}");
    }catch(e){
      log("Error getting movies: $e");
    }finally {
      isLoading = false;
      notifyListeners();
    }
  }

  Future<void> nowPlayingfn() async{
    isLoading = true;
    notifyListeners();
    try{
      nowPlaying = await apiServices.nowPlaying();
      log("Now playing movies loaded: ${movies.length}");
    }catch(e){
      log("Error getting movies: $e");
    }finally {
      isLoading = false;
      notifyListeners();
    }
  }

  Future<void> topRatedMovies() async{
    isLoading = true;
    notifyListeners();
    try{
      topRated = await apiServices.topRatedSer();
      log("Top rated movies loaded: ${movies.length}");
    }catch(e){
      log("Error getting movies: $e");
    }finally {
      isLoading = false;
      notifyListeners();
    }
  }

    Future<void> upcomingMovies() async{
    isLoading = true;
    notifyListeners();
    try{
      upcoming = await apiServices.upcomingMoviesSer();
      log("Upcoming movies loaded: ${movies.length}");
    }catch(e){
      log("Error getting movies: $e");
    }finally {
      isLoading = false;
      notifyListeners();
    }
  }

    Future<void> tvShows() async
  {
    isLoading = true;
    notifyListeners();
    try{
      tvShow = await apiServices.tvShowsSer();
      log("TV shows movies loaded: ${movies.length}");
    }catch(e){
      log("Error getting movies: $e");
    }finally {
      isLoading = false;
      notifyListeners();
    }
  }

  Future<void> searchFn()async{
    isLoading = true;
    notifyListeners();
    log("Search for ${searchController.text}");
    try{
    final result = await apiServices.movieSearh(movies: searchController.text.trim());
    searchList = result;
    log("Search Result loaded: ${searchList.length}");
    }catch(e){
      log("Error in search: $e");
    }finally {
      isLoading = false;
      notifyListeners();
    }
  }
}