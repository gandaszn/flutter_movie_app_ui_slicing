import 'dart:ui';

import 'package:flutter/material.dart';

import '../ui_constants.dart';

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
