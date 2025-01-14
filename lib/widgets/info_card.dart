import 'package:flutter/material.dart';
import 'package:url_launcher/link.dart';
import '../app_colors.dart';

class InfoCard extends StatelessWidget {
  final String name;
  final String organization;
  final Color color;
  final String url;

  const InfoCard({
    required this.name,
    required this.organization,
    required this.color,
    required this.url,
  });

  @override
  Widget build(BuildContext context) {
    return Link(
      uri: Uri.parse(url),
      target: LinkTarget.blank, // Opens in a new tab or browser
      builder: (BuildContext context, FollowLink? followLink) {
        return GestureDetector(
          onTap: followLink,
          child: Container(
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
                  height: 90,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/person_photo.webp'),
                      fit: BoxFit.cover,
                    ),
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
          ),
        );
      },
    );
  }
}
