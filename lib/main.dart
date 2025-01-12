import 'package:flutter/material.dart';
import 'app_colors.dart';
import 'pages/schedule_page.dart';
import 'pages/contact_page.dart';
import 'pages/guides_page.dart';
import 'pages/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
      ),
      home: SocialConclaveHome(),
    );
  }
}

class SocialConclaveHome extends StatefulWidget {
  @override
  _SocialConclaveHomeState createState() => _SocialConclaveHomeState();
}

class _SocialConclaveHomeState extends State<SocialConclaveHome> {
  int _selectedIndex = 0; // Track selected index

  // List of pages to display based on selection
  final List<Widget> _pages = [
    HomePage(), // Home page widget
    SchedulePage(), // Schedule page widget
    GuidesPage(), // Guides page widget
    ContactPage(), // Contact page widget
  ];

  // Function to handle BottomNavigationBar selection
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedIndex, // Set the current selected index
        selectedItemColor: AppColors.primaryBlue,
        unselectedItemColor: AppColors.gray,
        onTap: _onItemTapped, // Update the index when an item is tapped
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_today),
            label: 'Schedule',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.book),
            label: 'Guides',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.contact_mail),
            label: 'Contact',
          ),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: _pages[
              _selectedIndex], // Display the page based on the selected index
        ),
      ),
    );
  }
}
