class Movie {
  final int id;
  final String title;
  final String overview;
  final String imageUrl;
  final double imdbRating;
  final String genre;
  final String duration;
  final String releaseDate;

  Movie({
    required this.id,
    required this.title,
    required this.overview,
    required this.imageUrl,
    required this.imdbRating,
    required this.genre,
    required this.duration,
    required this.releaseDate,
  });
}
