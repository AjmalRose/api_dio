import 'package:api_project/controller/movie_provider.dart';
import 'package:api_project/views/widgets/common_widget.dart';
import 'package:api_project/views/widgets/home_widget.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';

class Moviedetailpage extends StatelessWidget {
  final String titleName;
  final String orginalLang;
  final String image;
  final String about;
  final String releaseDate;
  final String movieOrSeries;
  final int index;

  const Moviedetailpage({
    super.key,
    required this.titleName,
    required this.orginalLang,
    required this.image,
    required this.about,
    required this.releaseDate,
    required this.movieOrSeries,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: textCusomBold(titleName, 30),
        centerTitle: true,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                SizedBox(
                  child: Image.network(
                    image,
                    height: 450,
                    width: double.infinity,
                    fit: BoxFit.fill,
                  ),
                ),
                Center(
                  child: Padding(
                    padding: EdgeInsets.only(top: 150),
                    child: CircleAvatar(
                      radius: 35,
                      backgroundColor: Colors.black,
                      child: Icon(Icons.play_arrow, color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  textCusomBold(titleName, 30),
                  Row(
                    children: [
                      textCustom(releaseDate, 20),
                      const SizedBox(width: 20),
                      textCustom(orginalLang, 20),
                      const SizedBox(width: 20),
                      Icon(Icons.hd, color: Colors.white),
                    ],
                  ),
                  Gap(10),
                  Container(
                    height: 50,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.play_arrow, size: 34),
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
                    height: 50,
                    decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.download, size: 34),
                        Text(
                          "Download",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Gap(10),
                  textCustom(movieOrSeries, 20),
                  Gap(5),
                  textCustom(about, 18),
                  Padding(
                    padding: EdgeInsets.all(12),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Column(
                          children: [
                            Icon(Icons.add, color: Colors.white, size: 35),
                            textCustom("My List", 24),
                          ],
                        ),
                        Gap(40),
                        Column(
                          children: [
                            Icon(Icons.thumb_up, color: Colors.white, size: 35),
                            textCustom("Rate", 24),
                          ],
                        ),
                        Gap(40),
                        Column(
                          children: [
                            Icon(Icons.share, color: Colors.white, size: 35),
                            textCustom("Share", 24),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Consumer<MovieController>(
                    builder: (context, value, builder) {
                      return Column(
                        children: [
                          movieContainer(movieCategories: value.topRated),
                          Gap(10),
                          movieContainer(movieCategories: value.tvShow),
                          Gap(10),
                          movieContainer(movieCategories: value.movies),
                        ],
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
