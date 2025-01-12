import 'package:flutter/material.dart';
import '../widgets/info_card.dart';

class FullListPage extends StatelessWidget {
  final String title;
  final List<Map<String, String>> dataList;
  final Color color;

  const FullListPage({
    required this.title,
    required this.dataList,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title, style: TextStyle(color: color)),
        backgroundColor: Colors.black,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, // Number of cards in a row
            crossAxisSpacing: 32,
            mainAxisSpacing: 12,
          ),
          itemCount: dataList.length,
          itemBuilder: (context, index) {
            final item = dataList[index];
            return InfoCard(
              name: item['name']!,
              organization: item['organization']!,
              color: color,
            );
          },
        ),
      ),
    );
  }
}
