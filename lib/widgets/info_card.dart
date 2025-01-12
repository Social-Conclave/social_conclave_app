import 'package:flutter/material.dart';
import '../app_colors.dart';

class InfoCard extends StatelessWidget {
  final String name;
  final String organization;
  final Color color;

  const InfoCard(
      {required this.name, required this.organization, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 120,
      height: 140,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            height: 90, // Adjusted height for the image
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                    'assets/person_photo.webp'), // Add your image path here
                fit: BoxFit.cover,
              ),
              // borderRadius: BorderRadius.only(
              //   topLeft: Radius.circular(12),
              //   topRight: Radius.circular(12),
              // ),
            ),
          ),
          SizedBox(height: 12),
          Text(
            name,
            style: TextStyle(color: Colors.black, fontSize: 12),
            textAlign: TextAlign.center,
          ),
          Text(
            organization,
            style: TextStyle(color: AppColors.gray, fontSize: 10),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
