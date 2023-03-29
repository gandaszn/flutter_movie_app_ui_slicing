import 'package:flutter/material.dart';

import '../ui_constants.dart';

class HomeScreenTopBar extends StatefulWidget {
  const HomeScreenTopBar({Key? key}) : super(key: key);

  @override
  State<HomeScreenTopBar> createState() => _HomeScreenTopBarState();
}

class _HomeScreenTopBarState extends State<HomeScreenTopBar> {
  bool _isFirstChipSelected = true;
  bool _isSecondChipSelected = false;

  void _onFirstChipSelected() {
    setState(() {
      _isFirstChipSelected = true;
      _isSecondChipSelected = false;
    });
  }

  void _onSecondChipSelected() {
    setState(() {
      _isFirstChipSelected = false;
      _isSecondChipSelected = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TopBarChip(
          text: 'Now Showing',
          selected: _isFirstChipSelected,
          onSelected: _onFirstChipSelected,
        ),
        const SizedBox(width: 8),
        TopBarChip(
          text: 'Coming Soon',
          selected: _isSecondChipSelected,
          onSelected: _onSecondChipSelected,
        ),
      ],
    );
  }
}

class TopBarChip extends StatelessWidget {
  final String text;
  final bool selected;
  final VoidCallback onSelected;
  const TopBarChip({
    Key? key,
    required this.text,
    this.selected = false,
    required this.onSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onSelected,
      child: Container(
        decoration: BoxDecoration(
          color: selected ? CustomColors.orange : CustomColors.transparent,
          borderRadius: BorderRadius.circular(24),
          border: selected
              ? Border.all(
                  color: CustomColors.transparent,
                  width: 2,
                  strokeAlign: StrokeAlign.inside,
                )
              : Border.all(
                  color: CustomColors.transparentBorder,
                  width: 2,
                  strokeAlign: StrokeAlign.inside,
                ),
        ),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(12, 5, 12, 5),
          child: Text(
            text,
            style: CustomFonts.topBar.copyWith(color: CustomColors.white),
          ),
        ),
      ),
    );
  }
}
