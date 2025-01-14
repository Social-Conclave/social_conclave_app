import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';
import '../app_colors.dart';
import 'dart:io';

// Define the structure for PDF guide data
class GuideData {
  final String title;
  final String url;
  final String description;

  const GuideData({
    required this.title,
    required this.url,
    required this.description,
  });
}

class PDFViewerPage extends StatelessWidget {
  final String? pdfUrl;
  final String? assetPath;
  final String? localPath;
  final String title;

  const PDFViewerPage({
    Key? key,
    this.pdfUrl,
    this.assetPath,
    this.localPath,
    this.title = 'PDF Viewer',
  })  : assert(pdfUrl != null || assetPath != null || localPath != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          title,
          style: const TextStyle(
            color: AppColors.primaryBlue,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        iconTheme: const IconThemeData(color: AppColors.primaryBlue),
      ),
      body: _buildPDFView(),
    );
  }

  Widget _buildPDFView() {
    try {
      if (pdfUrl != null) {
        return SfPdfViewer.network(
          pdfUrl!,
        );
      } else if (assetPath != null) {
        return SfPdfViewer.asset(
          assetPath!,
        );
      } else if (localPath != null) {
        return SfPdfViewer.file(
          File(localPath!),
        );
      } else {
        return const Center(
          child: Text(
            'No PDF source provided',
            style: TextStyle(color: Colors.white),
          ),
        );
      }
    } catch (e) {
      return Center(
        child: Text(
          'Error loading PDF: $e',
          style: const TextStyle(color: Colors.white),
        ),
      );
    }
  }
}

class GuidesPage extends StatelessWidget {
  GuidesPage({Key? key}) : super(key: key);

  final List<GuideData> guidesData = [
    GuideData(
      title: 'Social Conclave Booklet',
      url: 'https://socialconclave.in/booklet.pdf',
      description: 'Complete guide for Social Conclave',
    ),
    GuideData(
      title: 'Study Material 1',
      url: 'https://socialconclave.in/booklet.pdf',
      description: 'Essential concepts and definitions',
    ),
    GuideData(
      title: 'Study Material 2',
      url: 'https://socialconclave.in/booklet.pdf',
      description: 'Practice questions and solutions',
    ),
    GuideData(
      title: 'Conference Guidelines',
      url: 'https://socialconclave.in/booklet.pdf',
      description: 'Important information for conference participants',
    ),
    GuideData(
      title: 'Research Methodology',
      url: 'https://socialconclave.in/booklet.pdf',
      description: 'Guide to research methods and practices',
    ),
    GuideData(
      title: 'Case Studies Collection',
      url: 'https://socialconclave.in/booklet.pdf',
      description: 'Compilation of relevant case studies',
    ),
    GuideData(
      title: 'Discussion Topics',
      url: 'https://socialconclave.in/booklet.pdf',
      description: 'List of topics for group discussions',
    ),
    GuideData(
      title: 'Presentation Templates',
      url: 'https://socialconclave.in/booklet.pdf',
      description: 'Templates for conference presentations',
    ),
    GuideData(
      title: 'Workshop Materials',
      url: 'https://socialconclave.in/booklet.pdf',
      description: 'Materials for workshop sessions',
    ),
    GuideData(
      title: 'Reference Guide',
      url: 'https://socialconclave.in/booklet.pdf',
      description: 'Additional references and resources',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            // SliverAppBar to keep "STUDY GUIDES" fixed at the top
            SliverAppBar(
              backgroundColor: Colors.black,
              pinned: true,
              title: const Text(
                'STUDY GUIDES',
                style: TextStyle(
                  color: AppColors.primaryBlue,
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                ),
              ),
              expandedHeight: 80,
            ),
            SliverPadding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              sliver: SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, index) {
                    final guide = guidesData[index];
                    return _buildGuideItem(context, guide.title, guide.url,
                        guide.description, index);
                  },
                  childCount: guidesData.length,
                ),
              ),
            ),
            const SliverPadding(
              padding: EdgeInsets.only(bottom: 16),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildGuideItem(BuildContext context, String title, String url,
      String description, int index) {
    print(index);
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: index % 2 == 0 ? AppColors.primaryBlue : AppColors.primaryGreen,
        borderRadius: BorderRadius.circular(12),
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.all(16),
        title: Text(
          title,
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Padding(
          padding: const EdgeInsets.only(top: 8),
          child: Text(
            description,
            style: TextStyle(
              color: AppColors.gray,
              fontSize: 14,
            ),
          ),
        ),
        trailing: const Icon(
          Icons.arrow_forward_ios,
          color: AppColors.gray,
          size: 20,
        ),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => PDFViewerPage(
                pdfUrl: url,
                title: title,
              ),
            ),
          );
        },
      ),
    );
  }
}
