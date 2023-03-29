import 'package:flutter/material.dart';

import '../ui_constants.dart';

class HomeScreenBottomBar extends StatefulWidget {
  const HomeScreenBottomBar({Key? key}) : super(key: key);

  @override
  State<HomeScreenBottomBar> createState() => _HomeScreenBottomBarState();
}

class _HomeScreenBottomBarState extends State<HomeScreenBottomBar> {
  List<Widget> icons = [
    const ImageIcon(
      AssetImage('assets/instagram-reels-icon.png'),
      size: 24,
    ),
    const Icon(Icons.search),
    const Icon(Icons.confirmation_num_outlined),
    const Icon(Icons.person_outline)
  ];

  int _selectedButtonIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: icons.asMap().entries.map((entry) {
        int index = entry.key;
        Widget icon = entry.value;

        return ElevatedButton(
          onPressed: () {
            setState(() {
              _selectedButtonIndex = index;
            });
          },
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: icon,
          ),
          style: ElevatedButton.styleFrom(
            backgroundColor: _selectedButtonIndex == index
                ? CustomColors.orange
                : CustomColors.white,
            foregroundColor: _selectedButtonIndex == index
                ? CustomColors.white
                : CustomColors.black,
            minimumSize: Size.zero,
            elevation: 0.0,
            padding: EdgeInsets.zero,
            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
            shape: CircleBorder(),
          ),
        );
      }).toList(),
    );
  }
}
