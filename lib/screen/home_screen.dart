import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_movie_app_ui_slicing/data/movies_data.dart';
import 'package:flutter_movie_app_ui_slicing/ui_constants.dart';

import '../widget/home_screen_bottom_bar.dart';
import '../widget/home_screen_carousel.dart';
import '../widget/home_screen_top_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentCarouselIndex = 0;

  void _onPageChanged(index, reason) {
    setState(() {
      _currentCarouselIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Stack(
            children: [
              Positioned(
                top: 0,
                child: Stack(
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.height / 2,
                      width: MediaQuery.of(context).size.width,
                      child: Image.network(
                        movieList[_currentCarouselIndex].imageUrl,
                        fit: BoxFit.fitWidth,
                        alignment: Alignment.topCenter,
                      ),
                    ),
                    AnimatedSwitcher(
                      duration: Duration(milliseconds: 500),
                      child: Container(
                        key:
                            ValueKey(movieList[_currentCarouselIndex].imageUrl),
                        height: MediaQuery.of(context).size.height / 2,
                        width: MediaQuery.of(context).size.width,
                        child: Image.network(
                          movieList[_currentCarouselIndex].imageUrl,
                          fit: BoxFit.fitWidth,
                          alignment: Alignment.topCenter,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Positioned.fill(
                child: BackdropFilter(
                  // filter: ImageFilter.blur(sigmaX: 0, sigmaY: 0),
                  filter: ImageFilter.blur(sigmaX: 60, sigmaY: 60),
                  child: Container(),
                ),
              )
            ],
          ),
          SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 10),
                HomeScreenTopBar(),
                SizedBox(height: 40),
                HomeScreenCarousel(onPageChanged: _onPageChanged),
                SizedBox(height: 36),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.access_time_outlined,
                      color: CustomColors.anotherGray,
                      size: 20,
                    ),
                    SizedBox(width: 4),
                    Text(
                      movieList[_currentCarouselIndex].duration,
                      style: CustomFonts.body,
                    ),
                  ],
                ),
                SizedBox(height: 12),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24 * 2),
                  child: Text(
                    movieList[_currentCarouselIndex].title,
                    style: CustomFonts.title,
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: movieList[_currentCarouselIndex]
                      .genres
                      .map(
                        (genre) => Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 4),
                          child: Container(
                            decoration: BoxDecoration(
                              color: CustomColors.transparent,
                              borderRadius: BorderRadius.circular(24),
                              border: Border.all(
                                color: CustomColors.gray,
                                width: 1,
                                strokeAlign: StrokeAlign.inside,
                              ),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(8, 4, 8, 4),
                              child: Text(
                                genre,
                                style: CustomFonts.body,
                              ),
                            ),
                          ),
                        ),
                      )
                      .toList(),
                ),
                Spacer(),
                HomeScreenBottomBar(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
