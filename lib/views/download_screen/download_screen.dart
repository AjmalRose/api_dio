import 'package:api_project/controller/movie_provider.dart';
import 'package:api_project/views/widgets/common_widget.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';

class DownloadScreen extends StatelessWidget {
  const DownloadScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: Image.asset('assets/maxresdefault.jpg'),
        leadingWidth: 100,
        toolbarHeight: 70,
        title: Text(
          'Downloads',
          style: TextStyle(fontWeight: FontWeight.w900, color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: Consumer<MovieController>(
        builder: (context, value, child) {
          if (value.movies.isEmpty) {
            return Center(child: textCustom("No downloads available", 20));
          }
          var imgList =
              Provider.of<MovieController>(context, listen: false).imagePath;
          return Column(
            children: [
              Padding(
                padding: EdgeInsets.all(8),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: textCustom('Your Downloads', 20),
                ),
              ),
              const Gap(10),
              Expanded(
                child: ListView.builder(
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    return Align(
                      alignment: Alignment.centerLeft,
                      child: Row(
                        children: [
                          Container(
                            height: 100,
                            width: 175,
                            margin: const EdgeInsets.symmetric(
                              vertical: 5,
                              horizontal: 10,
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child:
                                value.movies[index].posterPath != null
                                    ? ClipRRect(
                                      borderRadius: BorderRadius.circular(5),
                                      child: Image.network(
                                        "$imgList${value.movies[index].backdropPath}",
                                        fit: BoxFit.cover,
                                        errorBuilder: (
                                          context,
                                          error,
                                          stackTrace,
                                        ) {
                                          return const Icon(
                                            Icons.image_not_supported,
                                            color: Colors.red,
                                            size: 50,
                                          );
                                        },
                                      ),
                                    )
                                    : const Icon(
                                      Icons.image_not_supported,
                                      color: Colors.red,
                                      size: 50,
                                    ),
                          ),
                          Gap(10),
                          Expanded(
                            child: Text(
                              value.movies[index].title ?? "No Tite",
                              style: const TextStyle(
                                fontSize: 16,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                              maxLines: 2,
                            ),
                          ),
                          Icon(Icons.more_vert, color: Colors.white),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
