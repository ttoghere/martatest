import 'package:flutter/material.dart';

class ErkenTahsil extends StatelessWidget {
  final VoidCallback bottomSheet;
  const ErkenTahsil({
    Key? key,
    required this.bottomSheet,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const Column(
          children: [],
        ),
        Positioned(
          right: 30,
          bottom: 110,
          child: IconButton(
            padding: const EdgeInsets.all(15),
            style: IconButton.styleFrom(
              backgroundColor: const Color(0xFF5850EC),
            ),
            onPressed: bottomSheet,
            icon: const Icon(
              Icons.add,
              size: 25,
            ),
          ),
        ),
      ],
    );
  }
}
