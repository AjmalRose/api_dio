import 'package:flutter/material.dart';
import 'package:api_project/model/movie_model.dart';
import 'package:api_project/services/api_service.dart';
import 'package:api_project/views/upcomingMovieList.dart'; // ✅ import upcoming list file

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ApiService _apiService = ApiService();

  late Future<Movie?> _movieFuture;

  @override
  void initState() {
    super.initState();
    _movieFuture = _apiService.fetchMovies();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      // ✅ allows vertical scrolling for all movie sections
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 🎬 Now Playing Section
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: FutureBuilder<Movie?>(
              future: _movieFuture,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator(color: Colors.red),
                  );
                } else if (snapshot.hasError) {
                  return const Center(
                    child: Text(
                      "Oops! Something went wrong 😭",
                      style: TextStyle(color: Colors.white),
                    ),
                  );
                } else if (!snapshot.hasData || snapshot.data == null) {
                  return const Center(
                    child: Text(
                      "No movies found 🎬",
                      style: TextStyle(color: Colors.white),
                    ),
                  );
                } else {
                  final movies = snapshot.data!.results;
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsets.symmetric(
                          vertical: 10,
                          horizontal: 10,
                        ),
                        child: Text(
                          "Now Playing 🎥",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 350,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: movies.length,
                          itemBuilder: (context, index) {
                            final movie = movies[index];
                            return Padding(
                              padding: const EdgeInsets.only(right: 10),
                              child: Container(
                                width: 200,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  border: Border.all(
                                    color: Colors.grey.shade800,
                                    width: 1,
                                  ),
                                  image: DecorationImage(
                                    image: NetworkImage(
                                      "https://image.tmdb.org/t/p/w500${movie.posterPath}",
                                    ),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  );
                }
              },
            ),
          ),

          SizedBox(height: 20),

          //  Upcoming Movies Section
          UpcomingMovieList(),
        ],
      ),
    );
  }
}
