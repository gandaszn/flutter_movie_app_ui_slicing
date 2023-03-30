import 'dart:ui';

import 'package:flutter/material.dart';

import '../data/movie.dart';
import '../ui_constants.dart';

class MovieDetailScreen extends StatelessWidget {
  final Movie movie;

  MovieDetailScreen({Key? key, required this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    EdgeInsets padding = MediaQuery.of(context).padding;
    Size size = MediaQuery.of(context).size;

    return Stack(
      children: [
        Container(
          color: Colors.white,
        ),
        Hero(
          tag: 'poster_${movie.id}',
          child: Image.network(
            movie.imageUrl,
            fit: BoxFit.cover,
          ),
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(
                  top: padding.top,
                  left: 20,
                  right: 20,
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    FrostedBackButton(onPressed: () {
                      Navigator.pop(context);
                    }),
                    FrostedDuration(duration: movie.duration),
                  ],
                ),
              ),
              Spacer(),
              Padding(
                key: Key('this-one'),
                padding: EdgeInsets.only(bottom: padding.bottom),
                child: Container(
                  width: size.width,
                  height: size.height * 0.5,
                  color: Colors.white,
                  child: Column(
                    children: [
                      Spacer(),
                      _buildRating(context),
                      SizedBox(height: 16),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 24 * 2),
                        child: Text(
                          movie.title,
                          style: CustomFonts.title,
                          textAlign: TextAlign.center,
                          maxLines: 2,
                        ),
                      ),
                      SizedBox(height: 14),
                      _buildGenre(context),
                      SizedBox(height: 20),
                      // foto foto
                      _buildPhotos(context),
                      SizedBox(height: 22),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 24 * 2),
                        child: Text(
                          movie.overview,
                          style: CustomFonts.body,
                          textAlign: TextAlign.center,
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      Spacer(),
                      _buildBookingButton(context),
                      Spacer(),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildBookingButton(BuildContext context) => ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          backgroundColor: CustomColors.orange,
          foregroundColor: CustomColors.white,
          minimumSize: Size.zero,
          elevation: 0.0,
          padding: EdgeInsets.zero,
          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(40),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.only(
            left: 20,
            right: 20,
            top: 12,
            bottom: 12,
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Icon(
                Icons.confirmation_num_outlined,
                size: 28,
              ),
              SizedBox(width: 12),
              Padding(
                padding: const EdgeInsets.only(bottom: 1),
                child: Text(
                  'Booking',
                  style: CustomFonts.topBar.copyWith(fontSize: 17),
                ),
              ),
            ],
          ),
        ),
      );

  Widget _buildPhotos(BuildContext context) => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(
          5,
          (index) => Container(
            width: 64,
            height: 64,
            margin: EdgeInsets.symmetric(horizontal: 3),
            child: CircleAvatar(
              backgroundImage: NetworkImage(
                "https://fakeface.rest/thumb/view?gender=${index % 2 == 0 ? "male" : "female"}&minimum_age=${index * 9}",
              ),
            ),
          ),
        ),
      );

  Widget _buildRating(BuildContext context) => Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    movie.imdbRating.toString(),
                    style: CustomFonts.topBar,
                  ),
                  Text(
                    '/10',
                    style: CustomFonts.topBar.copyWith(
                      color: CustomColors.anotherGray,
                    ),
                  ),
                ],
              ),
              Text(
                'IMDb',
                style: CustomFonts.body.copyWith(
                  color: CustomColors.anotherGray,
                ),
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "${(movie.imdbRating * 10).toStringAsFixed(0)}%",
                style: CustomFonts.topBar,
              ),
              Text(
                'Rotten Tomatoes',
                style: CustomFonts.body.copyWith(
                  color: CustomColors.anotherGray,
                ),
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    movie.imdbRating.toString(),
                    style: CustomFonts.topBar,
                  ),
                  Text(
                    '/10',
                    style: CustomFonts.topBar.copyWith(
                      color: CustomColors.anotherGray,
                    ),
                  ),
                ],
              ),
              Text(
                'IGN',
                style: CustomFonts.body.copyWith(
                  color: CustomColors.anotherGray,
                ),
              ),
            ],
          ),
        ],
      );

  Widget _buildGenre(BuildContext context) => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: movie.genres
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
      );
}

class FrostedBackButton extends StatelessWidget {
  final VoidCallback onPressed;

  const FrostedBackButton({Key? key, required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(42),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
        child: Container(
          height: 42,
          width: 42,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
          ),
          child: Stack(
            children: [
              Center(
                child: Container(
                  height: 24,
                  width: 24,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.white, width: 1.5),
                  ),
                ),
              ),
              IconButton(
                padding: EdgeInsets.zero,
                icon: Icon(
                  Icons.close,
                  size: 14,
                  color: Colors.white,
                ),
                onPressed: onPressed,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class FrostedDuration extends StatelessWidget {
  final String duration;

  const FrostedDuration({Key? key, required this.duration}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(42),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 4,
            horizontal: 6,
          ),
          child: Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
            ),
            child: Row(
              children: [
                Icon(
                  Icons.access_time_outlined,
                  color: CustomColors.anotherGray,
                  size: 20,
                ),
                SizedBox(width: 4),
                Text(
                  duration,
                  style: CustomFonts.body.copyWith(
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
