import 'package:api_project/controller/movie_provider.dart';
import 'package:api_project/views/movieDetailPage/movieDetailPage.dart';
import 'package:api_project/views/widgets/search_widget.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:gap/gap.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});
  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<MovieController>(context, listen: false).searchFn();
    });
    super.initState();
  }

  TextEditingController search = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        leadingWidth: 60,
        toolbarHeight: 70,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.asset('assets/maxresdefault.jpg', fit: BoxFit.cover),
        ),
        title: Consumer<MovieController>(
          builder: (context, valu, child) {
            return searchBarCustom(
              hintText: "Search",
              searchController: valu.searchController,
              onSubmit: (value) => valu.searchFn(),
            );
          },
        ),
      ),
      body: Consumer<MovieController>(
        builder: (context, value, child) {
          if (value.isLoading) {
            return Center(child: CircularProgressIndicator());
          }
          if (value.searchList.isEmpty &&
              value.searchController.text.isNotEmpty) {
            return Center(
              child: Text(
                "No data found",
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
            );
          }
          if (value.searchList.isEmpty) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Gap(15),
                const Padding(
                  padding: EdgeInsets.only(left: 10, top: 20),
                  child: Text(
                    "Most Searches",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ),
                Gap(10),
                Expanded(
                  child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 12,
                      mainAxisSpacing: 12,
                      childAspectRatio: 0.7,
                    ),
                    itemCount: value.movies.length,
                    itemBuilder: (context, index) {
                      return ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: CachedNetworkImage(
                          imageUrl:
                              "${value.imagePath}${value.movies[index].posterPath}",
                          placeholder: (context, url) =>
                              const Center(child: CircularProgressIndicator()),
                          errorWidget: (context, url, error) =>
                              const Center(child: Icon(Icons.error)),
                        ),
                      );
                    },
                  ),
                ),
              ],
            );
          }
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Gap(30),
                Text(
                  "Top Searches",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: value.searchList.length,
                    itemBuilder: (context, index) {
                      var data = value.searchList[index];
                      return Row(
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => Moviedetailpage(
                                    titleName: data.title ?? '',
                                    orginalLang: data.originalLanguage ?? '',
                                    image:
                                        '${value.imagePath}${data.backdropPath ?? data.backdropPath}',
                                    about: data.overview ?? '',
                                    releaseDate: data.releaseDate ?? '',
                                    movieOrSeries: data.releaseDate ?? '',
                                    index: index,
                                  ),
                                ),
                              );
                            },
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: SizedBox(
                                height: 130,
                                width: 180,
                                child: CachedNetworkImage(
                                  imageUrl:
                                      "${value.imagePath}${data.backdropPath ?? data.backdropPath}",
                                  placeholder: (context, url) => const Center(
                                    child: CircularProgressIndicator(),
                                  ),
                                  errorWidget: (context, url, error) =>
                                      const Center(child: Icon(Icons.error)),
                                ),
                              ),
                            ),
                          ),
                          const Gap(20),
                          Expanded(
                            child: Text(
                              data.originalTitle ??
                                  data.originalName ??
                                  data.title ??
                                  data.name ??
                                  "No Title",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                              ),
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.only(right: 10),
                            child: Icon(Icons.play_arrow, color: Colors.white),
                          ),
                        ],
                      );
                    },
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
