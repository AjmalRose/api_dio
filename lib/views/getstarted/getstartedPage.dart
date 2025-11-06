import 'package:api_project/constants/image.dart';
import 'package:api_project/views/getstarted/getStartingbutton.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class GetStarted extends StatelessWidget {
  const GetStarted({super.key});
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: Stack(
        children: [
          CarouselSlider(
            options: CarouselOptions(
              height: double.infinity,
              viewportFraction: 1.0,
              autoPlay: true,
              autoPlayInterval: const Duration(seconds: 2),
              enableInfiniteScroll: true,
              scrollDirection: Axis.horizontal,
              pauseAutoPlayOnTouch: true,
              disableCenter: true,
              scrollPhysics: const NeverScrollableScrollPhysics(),
              enlargeCenterPage: false,
            ),
            items: ImageAsset.superheroImages.map((imagePath) {
              return Image.asset(
                imagePath,
                width: double.infinity,
                height: double.infinity,
                fit: BoxFit.cover,
              );
            }).toList(),
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  /// 🔹 Title
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Gap(60),
                      Text(
                        'Unleash Your Inner Hero!',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 36,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Gap(12),
                      Text(
                        'Enter the multiverse of might, brains, and speed.',
                        style: TextStyle(
                          color: Colors.white70,
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      CustomButton(size: size),
                      const Gap(20),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
