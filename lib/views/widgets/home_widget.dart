import 'package:api_project/controller/movie_provider.dart';
import 'package:api_project/views/movieDetailPage/movieDetailPage.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';

Widget categoryButton(VoidCallback onPressed, String text) {
  return MaterialButton(
    onPressed: onPressed,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(20),
      side: BorderSide(color: Colors.white38),
    ),
    child: Row(
      children: [
        Text(text, style: TextStyle(color: Colors.white, fontSize: 18)),
      ],
    ),
  );
}

Widget titleText(String title) {
  return Text(
    title,
    style: TextStyle(
      color: Colors.white,
      fontSize: 20,
      fontWeight: FontWeight.w900,
    ),
  );
}

Widget nowPlayingMovieBox({required List<dynamic> movieList}) {
  return Consumer<MovieController>(
    builder: (context, value, child) {
      if (movieList.isEmpty) {
        return Center(
          child: Shimmer.fromColors(
            baseColor: Colors.grey.shade800,
            highlightColor: Colors.grey.shade600,
            child: Container(
              width: 150,
              height: 250,
              decoration: const BoxDecoration(
                color: Colors.grey,
                shape: BoxShape.rectangle,
              ),
            ),
          ),
        );
      }
      return Padding(
        padding: EdgeInsets.symmetric(horizontal: 8),
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Container(
              height: 530,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: Colors.grey.shade800),
              ),
              child: PageView.builder(
                itemCount: movieList.length,
                itemBuilder: (context, index) {
                  var movie = movieList[index];
                  var imgUrl = "${value.imagePath}${movie.posterPath}";
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder:
                              (context) => Moviedetailpage(
                                titleName: movie.title ?? '',
                                orginalLang: movie.originalLanguage ?? '',
                                image: imgUrl,
                                about: movie.overview ?? '',
                                releaseDate: movie.releaseDate ?? '',
                                movieOrSeries: movie.mediaType ?? '',
                                index: index,
                              ),
                        ),
                      );
                    },
                    child: Container(
                      height: 530,
                      width: 388,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white,
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
            Positioned(
              bottom: -30,
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 0, horizontal: 39),
                child: Row(
                  children: [
                    Container(
                      width: 120,
                      height: 50,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.play_arrow),
                          Gap(10),
                          Text(
                            "Play",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Gap(10),
                    Container(
                      width: 120,

                      height: 50,
                      decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.add),
                          Gap(10),
                          Text(
                            "My List",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      );
    },
  );
}

// Widget movieTrendingBox({required List<dynamic> movieList}) {
//   return Consumer<MovieController>(
//     builder: (context, value, child) {
//       if (movieList.isEmpty) {
//         return Center(
//           child: Shimmer.fromColors(
//             baseColor: Colors.grey.shade800,
//             highlightColor: Colors.grey.shade600,
//             child: Container(
//               width: 50,
//               height: 50,
//               decoration: const BoxDecoration(
//                 color: Colors.grey,
//                 shape: BoxShape.circle,
//               ),
//             ),
//           ),
//         );
//       }
//       return SizedBox(
//         height: 500,
//         width: double.infinity,
//         child: SingleChildScrollView(
//           scrollDirection: Axis.horizontal,
//           child: Row(
//             children:
//                 movieList.map<Widget>((movie) {
//                   return Padding(
//                     padding: EdgeInsets.all(8.0),
//                     child: ClipRRect(
//                       borderRadius: BorderRadius.circular(20),
//                       child: Image.network(
//                         "https://image.tmdb.org/t/p/w500${movie.posterPath}",
//                         fit: BoxFit.cover,
//                         errorBuilder:
//                             (context, error, stackTrace) => Icon(Icons.error),
//                       ),
//                     ),
//                   );
//                 }).toList(),
//           ),
//         ),
//       );
//     },
//   );
// }

Widget movieContainer({required List<dynamic> movieCategories}) {
  return Consumer<MovieController>(
    builder: (context, value, child) {
      if (movieCategories.isEmpty) {
        return Center(
          child: Shimmer.fromColors(
            baseColor: Colors.grey.shade800,
            highlightColor: Colors.grey.shade600,
            child: Container(
              width: 50,
              height: 50,
              decoration: const BoxDecoration(
                color: Colors.grey,
                shape: BoxShape.circle,
              ),
            ),
          ),
        );
      }
      return SizedBox(
        height: 200,
        child: ListView.builder(
          itemCount: movieCategories.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            var data = movieCategories[index];
            var imgUrl = "${value.imagePath}${data.posterPath ?? ''}";
            return Padding(
              padding: EdgeInsets.all(8),
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder:
                          (context) => Moviedetailpage(
                            titleName: data.title ?? '',
                            orginalLang: data.originalLanguage ?? '',
                            image: imgUrl,
                            about: data.overview ?? '',
                            releaseDate: data.releaseDate ?? '',
                            movieOrSeries: data.mediaType ?? '',
                            index: index,
                          ),
                    ),
                  );
                },
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.network(
                    imgUrl,
                    height: 170,
                    width: 130,
                    fit: BoxFit.cover,
                    errorBuilder:
                        (context, error, stackTrace) => const Center(
                          child: Icon(Icons.error, color: Colors.red),
                        ),
                  ),
                ),
              ),
            );
          },
        ),
      );
    },
  );
}
