import 'package:flutter/material.dart';
import '../app_colors.dart';
import '../widgets/section_header.dart';
import '../widgets/info_card.dart';
import 'full_list_page.dart';
import '../data/jury_info.dart';
import '../data/industry_experts_info.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Header
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  child: Container(
                    child: Text(
                      'SOCIAL CONCLAVE',
                      style: TextStyle(
                        color: AppColors.primaryBlue,
                        fontSize: 38,
                        height: 0.9,
                        fontFamily: 'Nohemi',
                        fontWeight: FontWeight.w700, // Bold
                      ),
                      softWrap: true,
                      maxLines: 2,
                      overflow:
                          TextOverflow.ellipsis, // Ensure text doesn't overflow
                    ),
                  ),
                ),
                SizedBox(
                    width: 10), // Add spacing between the text and the logo
                CircleAvatar(
                  backgroundImage:
                      AssetImage('assets/logo.png'), // Add your logo image here
                  radius: 40,
                  backgroundColor: Colors.transparent,
                ),
              ],
            ),
            SizedBox(height: 40),

            // Updates Section
            Text(
              'UPDATES',
              style: TextStyle(
                  color: AppColors.primaryGreen,
                  fontSize: 18,
                  fontFamily: 'Nohemi',
                  fontWeight: FontWeight.w200),
            ),
            SizedBox(height: 10),
            Container(
              decoration: BoxDecoration(
                color: AppColors.primaryGreen,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: List.generate(
                    4,
                    (index) => Row(
                      children: [
                        Icon(Icons.check, color: Colors.green),
                        SizedBox(width: 8),
                        Text(
                          'Priority Registrations Now Open!',
                          style: TextStyle(color: Colors.black),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),

            // Industry Experts Section
            SectionHeader(
              title: 'INDUSTRY EXPERTS',
              color: AppColors.primaryBlue,
              onArrowTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => FullListPage(
                      title: "Industry Experts",
                      dataList: industryExperts,
                      color: AppColors.primaryBlue,
                    ),
                  ),
                );
              },
            ),
            SizedBox(height: 10),
            Container(
              height: 160,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: industryExperts.length,
                itemBuilder: (context, index) {
                  final expert = industryExperts[index];
                  return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: InfoCard(
                        name: expert['name']!,
                        organization: expert['organization']!,
                        color: AppColors.primaryBlue,
                        url: expert['link'] ?? 'https://socialconclave.in',
                      ));
                },
              ),
            ),
            SizedBox(height: 20),

            // Jury Section
            SectionHeader(
              title: 'JURY',
              color: AppColors.primaryGreen,
              onArrowTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => FullListPage(
                      title: "Jury",
                      dataList: juryMembers,
                      color: AppColors.primaryGreen,
                    ),
                  ),
                );
              },
            ),
            SizedBox(height: 10),
            Container(
              height: 160,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: juryMembers.length,
                itemBuilder: (context, index) {
                  final jury = juryMembers[index];
                  return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: InfoCard(
                        name: jury['name']!,
                        organization: jury['organization']!,
                        color: AppColors.primaryGreen,
                        url: jury['link'] ?? 'https://socialconclave.in',
                      ));
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
