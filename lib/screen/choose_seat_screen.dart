import 'package:flutter/material.dart';
import 'package:flutter_movie_app_ui_slicing/screen/home_screen.dart';

import '../data/movie.dart';

class ChooseSeatScreen extends StatefulWidget {
  final Movie movie;
  const ChooseSeatScreen({Key? key, required this.movie}) : super(key: key);

  @override
  State<ChooseSeatScreen> createState() => _ChooseSeatScreenState();
}

class _ChooseSeatScreenState extends State<ChooseSeatScreen> {
  String chosenMovieTime = '14:30';
  String chosenMovieDate = 'Monday, 27 March 2023';

  int chosenTicketCount = 2;
  List<String> chosenSeats = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Choose Your Seat'),
      ),
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                    flex: 8,
                    child: SizedBox(
                      height: 200,
                      child: Image.network(
                        widget.movie.imageUrl,
                        fit: BoxFit.fitHeight,
                        alignment: Alignment.centerLeft,
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 10,
                    child: Column(
                      children: [
                        Text(
                          widget.movie.title,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 24,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          '$chosenMovieTime - $chosenMovieDate - ${widget.movie.duration}',
                          style: TextStyle(
                            color: Colors.grey[600],
                          ),
                        ),
                        const SizedBox(height: 16),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              'Number of Tickets:',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                            Text(
                              chosenTicketCount.toString(),
                              style: const TextStyle(
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              const Text(
                'Choose Your Seat:',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 16),
              Expanded(
                flex: 38,
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 10,
                    childAspectRatio: 1.1,
                  ),
                  itemCount: 100,
                  itemBuilder: (BuildContext context, int index) {
                    final row = index ~/ 10 + 1;
                    final column = index % 10 + 1;
                    final seatName =
                        String.fromCharCode(row + 64) + column.toString();
                    bool isSelected = chosenSeats.contains(seatName);

                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          if (isSelected) {
                            chosenSeats.remove(seatName);
                          } else {
                            chosenSeats.add(seatName);
                          }
                        });
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(2),
                        child: Container(
                          decoration: BoxDecoration(
                            color: isSelected ? Colors.blue : Colors.grey[300],
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: Center(
                            child: Text(
                              seatName,
                              style: TextStyle(
                                color: isSelected ? Colors.white : Colors.black,
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              Expanded(
                flex: 10,
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
                          Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                builder: (context) => HomeScreen(),
                              ),
                              ModalRoute.withName('home'));
                        },
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
