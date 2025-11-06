import 'package:api_project/controller/movie_provider.dart';
import 'package:api_project/views/searchPage/search_screen.dart';
import 'package:api_project/views/widgets/home_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';
import 'package:gap/gap.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final provider = Provider.of<MovieController>(context, listen: false);
      provider.getAllMovies();
      provider.nowPlayingfn();
      provider.topRatedMovies();
      provider.upcomingMovies();
      provider.tvShows();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Image.asset(
          'assets/3f4fda87427327.5db8191c88bea.jpg',
          height: 120,
          width: 150,
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SearchScreen()),
              );
            },
            icon: Icon(Icons.search, color: Colors.white),
          ),
          Gap(20),
          Icon(Icons.cast, color: Colors.white),
          Gap(20),
          Icon(Icons.download, color: Colors.white),
        ],
      ),
      backgroundColor: Colors.black,
      body: ListView(
        children: [
          Padding(
            padding: EdgeInsets.only(left: 10),
            child: Row(
              children: [
                categoryButton(() {}, "TV Shows"),
                Gap(10),
                categoryButton(() {}, "Movies"),
                Gap(10),
                categoryButton(() {}, "Categories"),
              ],
            ),
          ),
          Consumer<MovieController>(
            builder: (context, value, _) {
              return SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.all(8),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          nowPlayingMovieBox(movieList: value.nowPlaying),
                          Gap(50),
                          titleText("Recent Releases Movies"),
                          movieContainer(movieCategories: value.movies),
                          Gap(20),
                          titleText("Top Rated Movies"),
                          movieContainer(movieCategories: value.topRated),
                          Gap(20),
                          titleText("Upcoming Movies"),
                          movieContainer(movieCategories: value.upcoming),
                          Gap(20),
                          titleText("TV Shows"),
                          movieContainer(movieCategories: value.tvShow),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
