import 'package:book_my_seat/book_my_seat.dart';
import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_movie_app_ui_slicing/data/movie.dart';
import 'package:flutter_movie_app_ui_slicing/ui_constants.dart';

import '../widget/frosted_back_button.dart';

class MovieTicketScreen extends StatelessWidget {
  final Movie movie;
  const MovieTicketScreen({Key? key, required this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    EdgeInsets padding = MediaQuery.of(context).padding;
    Size size = MediaQuery.of(context).size;

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light,
      child: Scaffold(
        backgroundColor: CustomColors.black,
        body: Stack(
          children: [
            Positioned(
              bottom: 0,
              child: Container(
                height: padding.bottom,
                width: size.width,
                color: Colors.white,
              ),
            ),
            SafeArea(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                      // top: padding.top,
                      left: 20,
                      right: 20,
                    ),
                    child: Stack(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 8),
                          child: Image.asset('assets/screen.png'),
                        ),
                        Container(
                            height: 42,
                            width: 42,
                            decoration: BoxDecoration(
                              color: Colors.grey,
                              shape: BoxShape.circle,
                            )),
                        FrostedBackButton(onPressed: () {
                          Navigator.pop(context);
                        }),
                      ],
                    ),
                  ),
                  // screen
                  SizedBox(height: 12),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SeatLayout(),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16.0, vertical: 24),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _buildSeatDescription(
                          context,
                          color: Color(0xffffffff),
                          description: 'Available',
                        ),
                        _buildSeatDescription(
                          context,
                          color: Color(0xff404040),
                          description: 'Reserved',
                        ),
                        _buildSeatDescription(
                          context,
                          color: Color(0xffFF5524),
                          description: 'Selected',
                        ),
                      ],
                    ),
                  ),
                  Flexible(
                    child: Container(
                      padding: EdgeInsets.only(
                        left: 24,
                        top: 16,
                      ),
                      width: MediaQuery.of(context).size.width,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(24.0),
                          topRight: Radius.circular(24.0),
                        ),
                      ),
                      child: Column(
                        children: [
                          // Text(
                          //   selectedSeats.join(" , "),
                          //   style: CustomFonts.body.copyWith(
                          //     color: CustomColors.anotherGray,
                          //   ),
                          // )
                          CustomDatePicker(),
                          ChipRow(),
                          Spacer(),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    '\$100.00',
                                    style: CustomFonts.title.copyWith(),
                                  ),
                                  Text(
                                    '4 tickets',
                                    style: CustomFonts.body.copyWith(
                                      fontSize: 12,
                                      color: CustomColors.anotherGray,
                                    ),
                                  )
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.only(right: 24),
                                child: _buildBuyTicketButton(context),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBuyTicketButton(BuildContext context) => ElevatedButton(
        onPressed: () {
          Navigator.popUntil(context, (route) => route.isFirst);
        },
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
                  'Buy Ticket',
                  style: CustomFonts.topBar.copyWith(fontSize: 17),
                ),
              ),
            ],
          ),
        ),
      );

  Widget _buildSeatDescription(
    BuildContext context, {
    required Color color,
    required String description,
  }) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 20,
          height: 20,
          decoration: BoxDecoration(
            color: color,
            shape: BoxShape.circle,
          ),
        ),
        const SizedBox(width: 2),
        Text(
          description,
          style: CustomFonts.body.copyWith(
            color: CustomColors.anotherGray,
          ),
        )
      ],
    );
  }
}

class ChipRow extends StatefulWidget {
  @override
  _ChipRowState createState() => _ChipRowState();
}

class _ChipRowState extends State<ChipRow> {
  int selectedIndex = 0;
  List<String> times = ['10:00', '12:30', '15:30', '18:30', '21:30'];

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: List<Widget>.generate(
        times.length,
        (int index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4.0),
            child: ChoiceChip(
              label: Text(
                times[index],
                style: CustomFonts.body.copyWith(
                  color: selectedIndex == index ? Colors.white : Colors.black,
                ),
              ),
              selected: selectedIndex == index,
              selectedColor: CustomColors.brownish,
              backgroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0),
                side: BorderSide(
                  color: CustomColors.gray,
                  width: 1,
                ),
              ),
              onSelected: (bool selected) {
                setState(() {
                  selectedIndex = selected ? index : 0;
                });
              },
            ),
          );
        },
      ).toList(),
    );
  }
}

class CustomDatePicker extends StatefulWidget {
  const CustomDatePicker({Key? key}) : super(key: key);

  @override
  State<CustomDatePicker> createState() => _CustomDatePickerState();
}

class _CustomDatePickerState extends State<CustomDatePicker> {
  @override
  Widget build(BuildContext context) {
    return DatePicker(
      DateTime.now(),
      initialSelectedDate: DateTime.now(),
      selectionColor: CustomColors.brownish,
      selectedTextColor: Colors.white,
      monthTextStyle: CustomFonts.body.copyWith(
        fontSize: 10,
        color: CustomColors.anotherGray,
      ),
      dayTextStyle: CustomFonts.body.copyWith(
        fontSize: 12,
        color: CustomColors.anotherGray,
      ),
      dateTextStyle: CustomFonts.title.copyWith(
        fontSize: 16,
      ),
      onDateChange: (date) {
        // New date selected
        setState(() {
          // _selectedValue = date;
        });
      },
    );
  }
}

class SeatLayout extends StatefulWidget {
  const SeatLayout({Key? key}) : super(key: key);

  @override
  State<SeatLayout> createState() => _SeatLayoutState();
}

class _SeatLayoutState extends State<SeatLayout> {
  Set<SeatNumber> selectedSeats = {};

  @override
  Widget build(BuildContext context) {
    return SeatLayoutWidget(
      onSeatStateChanged: (rowI, colI, seatState) {
        if (seatState == SeatState.selected) {
          selectedSeats.add(SeatNumber(rowI: rowI, colI: colI));
        } else {
          selectedSeats.remove(SeatNumber(rowI: rowI, colI: colI));
        }
        // selectedSeats.join(" , ");
      },
      stateModel: const SeatLayoutStateModel(
        rows: 10,
        cols: 10,
        seatSvgSize: 36,
        pathSelectedSeat: 'assets/seat_selected.svg',
        pathDisabledSeat: 'assets/seat_disabled.svg',
        pathSoldSeat: 'assets/seat_sold.svg',
        pathUnSelectedSeat: 'assets/seat_unselected.svg',
        currentSeatsState: [
          [
            SeatState.unselected,
            SeatState.unselected,
            SeatState.unselected,
            SeatState.sold,
            SeatState.sold,
            SeatState.sold,
            SeatState.sold,
            SeatState.unselected,
            SeatState.unselected,
            SeatState.unselected,
          ],
          [
            SeatState.unselected,
            SeatState.unselected,
            SeatState.unselected,
            SeatState.sold,
            SeatState.sold,
            SeatState.sold,
            SeatState.sold,
            SeatState.unselected,
            SeatState.unselected,
            SeatState.unselected,
          ],
          [
            SeatState.sold,
            SeatState.sold,
            SeatState.sold,
            SeatState.sold,
            SeatState.unselected,
            SeatState.unselected,
            SeatState.unselected,
            SeatState.unselected,
            SeatState.sold,
            SeatState.sold,
          ],
          [
            SeatState.sold,
            SeatState.sold,
            SeatState.unselected,
            SeatState.unselected,
            SeatState.unselected,
            SeatState.unselected,
            SeatState.unselected,
            SeatState.sold,
            SeatState.sold,
            SeatState.sold,
          ],
          [
            SeatState.unselected,
            SeatState.unselected,
            SeatState.unselected,
            SeatState.unselected,
            SeatState.unselected,
            SeatState.unselected,
            SeatState.unselected,
            SeatState.unselected,
            SeatState.unselected,
            SeatState.unselected,
          ],
          [
            SeatState.unselected,
            SeatState.unselected,
            SeatState.unselected,
            SeatState.unselected,
            SeatState.unselected,
            SeatState.unselected,
            SeatState.unselected,
            SeatState.unselected,
            SeatState.unselected,
            SeatState.unselected,
          ],
          [
            SeatState.unselected,
            SeatState.unselected,
            SeatState.unselected,
            SeatState.unselected,
            SeatState.unselected,
            SeatState.unselected,
            SeatState.unselected,
            SeatState.unselected,
            SeatState.unselected,
            SeatState.unselected,
          ],
          [
            SeatState.unselected,
            SeatState.unselected,
            SeatState.unselected,
            SeatState.unselected,
            SeatState.unselected,
            SeatState.unselected,
            SeatState.unselected,
            SeatState.unselected,
            SeatState.unselected,
            SeatState.unselected,
          ],
          [
            SeatState.unselected,
            SeatState.unselected,
            SeatState.sold,
            SeatState.sold,
            SeatState.sold,
            SeatState.sold,
            SeatState.sold,
            SeatState.unselected,
            SeatState.unselected,
            SeatState.unselected,
          ],
          [
            SeatState.unselected,
            SeatState.unselected,
            SeatState.unselected,
            SeatState.unselected,
            SeatState.unselected,
            SeatState.sold,
            SeatState.sold,
            SeatState.sold,
            SeatState.unselected,
            SeatState.unselected,
          ],
        ],
      ),
    );
  }
}

class SeatNumber {
  final int rowI;
  final int colI;

  const SeatNumber({required this.rowI, required this.colI});

  @override
  bool operator ==(Object other) {
    return rowI == (other as SeatNumber).rowI &&
        colI == (other as SeatNumber).colI;
  }

  @override
  int get hashCode => rowI.hashCode;

  @override
  String toString() {
    return '[$rowI][$colI]';
  }
}
