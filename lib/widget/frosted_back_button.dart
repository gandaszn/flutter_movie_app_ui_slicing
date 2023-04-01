import 'dart:ui';

import 'package:flutter/material.dart';

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
