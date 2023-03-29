import 'package:flutter/material.dart';
import 'package:flutter_movie_app_ui_slicing/screen/choose_seat_screen.dart';

import '../data/movie.dart';

class MovieDetailScreen extends StatefulWidget {
  final Movie movie;

  const MovieDetailScreen({Key? key, required this.movie}) : super(key: key);

  @override
  State<MovieDetailScreen> createState() => _MovieDetailScreenState();
}

class _MovieDetailScreenState extends State<MovieDetailScreen> {
  bool isFavorited = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.movie.title),
      ),
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: 20),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: AspectRatio(
                      aspectRatio: 3 / 4,
                      child: Image.network(widget.movie.imageUrl)),
                  flex: 8,
                ),
                Expanded(
                  flex: 10,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.movie.title,
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        widget.movie.genres.join(', '),
                        style: TextStyle(fontSize: 18),
                      ),
                      SizedBox(height: 10),
                      Text(
                        'IMDb Rating: ${widget.movie.imdbRating.toString()}',
                        style: TextStyle(fontSize: 18),
                      ),
                      SizedBox(height: 10),
                      Text(
                        'Duration: ${widget.movie.duration}',
                        style: TextStyle(fontSize: 18),
                      ),
                      SizedBox(height: 10),
                      Text(
                        'Release Date: ${widget.movie.releaseDate}',
                        style: TextStyle(fontSize: 18),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            Text(
              widget.movie.overview,
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {},
                  child: Text('Trailer'),
                ),
                ElevatedButton(
                  onPressed: () {},
                  child: Text('Rate'),
                ),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      isFavorited = !isFavorited;
                    });
                  },
                  child: Icon(
                    isFavorited ? Icons.favorite : Icons.favorite_border,
                  ),
                ),
                ElevatedButton(
                  onPressed: () {},
                  child: Text('Share'),
                ),
              ],
            ),
            SizedBox(height: 20),
            Expanded(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      child: Padding(
                        padding: const EdgeInsets.all(16),
                        child: const Text(
                          'Buy Ticket',
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                ChooseSeatScreen(movie: widget.movie),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
