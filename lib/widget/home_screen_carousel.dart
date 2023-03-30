import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../data/movies_data.dart';
import '../screen/movie_detail_screen.dart';

class HomeScreenCarousel extends StatelessWidget {
  final Function(int, CarouselPageChangedReason)? onPageChanged;
  const HomeScreenCarousel({Key? key, this.onPageChanged}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<Widget> imageSliders = movieList
        .map(
          (movie) => GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => MovieDetailScreen(movie: movie),
                ),
              );
            },
            child: Hero(
              tag: 'poster_${movie.id}',
              child: ClipRRect(
                borderRadius: BorderRadius.circular(24),
                child: Image.network(
                  movie.imageUrl,
                  fit: BoxFit.cover,
                ),
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
          onPageChanged: onPageChanged),
      items: imageSliders,
    );
  }
}
