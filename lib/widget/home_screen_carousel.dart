import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../data/movies_data.dart';

class HomeScreenCarousel extends StatelessWidget {
  const HomeScreenCarousel({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<Widget> imageSliders = movieList
        .map(
          (movie) => ClipRRect(
            borderRadius: BorderRadius.circular(24),
            child: SizedBox(
              child: Image.network(
                movie.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
          ),
        )
        .toList();

    return CarouselSlider(
      options: CarouselOptions(
        viewportFraction: 0.69,
        autoPlay: false,
        autoPlayInterval: const Duration(seconds: 5),
        enlargeCenterPage: true,
        enlargeFactor: 0.18,
        aspectRatio: 270 / 400,
        height: 400,
      ),
      items: imageSliders,
    );
  }
}
