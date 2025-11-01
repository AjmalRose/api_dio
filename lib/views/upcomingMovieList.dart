import 'package:flutter/material.dart';
import 'package:api_project/model/upcoming_movie_model.dart';
import 'package:api_project/services/api_service.dart';

class UpcomingMovieList extends StatefulWidget {
  const UpcomingMovieList({super.key});

  @override
  State<UpcomingMovieList> createState() => _UpcomingMovieListState();
}

class _UpcomingMovieListState extends State<UpcomingMovieList> {
  final ApiService _apiService = ApiService();
  late Future<UpcomingMovie?> _upcomingFuture;

  @override
  void initState() {
    super.initState();
    _upcomingFuture = _apiService.upcomingMovie();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(left: 10, top: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 🎬 Section Title
            const Text(
              "Upcoming Movies 🍿",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 22,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 15),

            // 🌀 Upcoming Movies List
            SizedBox(
              height: 200,
              width: double.infinity,
              child: FutureBuilder<UpcomingMovie?>(
                future: _upcomingFuture,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(
                      child: CircularProgressIndicator(color: Colors.red),
                    );
                  } else if (snapshot.hasError) {
                    return Center(
                      child: Text(
                        "Error: ${snapshot.error}",
                        style: const TextStyle(color: Colors.white),
                      ),
                    );
                  } else if (!snapshot.hasData || snapshot.data == null) {
                    return const Center(
                      child: Text(
                        "No upcoming movies found 😕",
                        style: TextStyle(color: Colors.white),
                      ),
                    );
                  } else {
                    final movies = snapshot.data!.results;

                    return ListView.builder(
                      scrollDirection: Axis.horizontal,
                      // 🧩 ADD THESE TWO LINES 👇👇
                      shrinkWrap: true,

                      // 🧩 END
                      itemCount: movies.length,
                      itemBuilder: (context, index) {
                        final movie = movies[index];
                        return GestureDetector(
                          onTap: () {
                            // 🎥 You can navigate to movie details page later here
                          },
                          child: Padding(
                            padding: const EdgeInsets.only(right: 10),
                            child: Container(
                              width: 150,
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
                          ),
                        );
                      },
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
