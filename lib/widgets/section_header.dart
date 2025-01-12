import 'package:flutter/material.dart';

class SectionHeader extends StatelessWidget {
  final String title;
  final Color color;
  final VoidCallback onArrowTap; // Callback for the arrow tap

  const SectionHeader({
    required this.title,
    required this.color,
    required this.onArrowTap,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextStyle(
            color: color,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        GestureDetector(
          onTap: onArrowTap, // Trigger navigation on tap
          child: Icon(Icons.arrow_forward, color: color),
        ),
      ],
    );
  }
}
