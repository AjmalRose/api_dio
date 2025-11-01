import 'package:api_project/model/movie_model.dart';
import 'package:api_project/model/upcoming_movie_model.dart';
import 'package:api_project/services/utils.dart';
import 'package:dio/dio.dart';

class ApiService {
  final Dio _dio = Dio();

  // now playing movies
  Future<Movie?> fetchMovies() async {
    try {
      const endPoint = "movie/now_playing";
      final apiUrl = "$baseUrl$endPoint?api_key=$apiKey";

      final response = await _dio.get(apiUrl);

      if (response.statusCode == 200) {
        return Movie.fromJson(response.data);
      } else {
        throw Exception("Failed to load movies: ${response.statusCode}");
      }
    } catch (e) {
      print("Error fetching movies: $e");
      return null;
    }
  }

  //upcoming movies
  Future<UpcomingMovie?> upcomingMovie() async {
    try {
      const endPoint = "movie/upcoming";
      final apiUrl = "$baseUrl$endPoint?api_key=$apiKey";

      final response = await _dio.get(apiUrl);
      print("🔹 Upcoming API URL: $apiUrl");
      print("🔹 Status: ${response.statusCode}");

      if (response.statusCode == 200) {
        return UpcomingMovie.fromJson(response.data); // ✅ Correct
      } else {
        throw Exception("Failed to load movies: ${response.statusCode}");
      }
    } catch (e) {
      print("❌ Error fetching upcoming movies: $e");
      return null;
    }
  }
}
