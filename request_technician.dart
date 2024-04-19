import 'package:flutter/material.dart';

class RequestTechnicianPage extends StatefulWidget {
  @override
  _RequestTechnicianPageState createState() => _RequestTechnicianPageState();
}

class _RequestTechnicianPageState extends State<RequestTechnicianPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Request Technician Page'),
      ),
      body: Stack(
        children: [
          // Background Image
          Positioned.fill(
            child: Image.asset(
              'assets/mechanic.jpg', // Replace 'assets/background_image.jpg' with your actual image path
              fit: BoxFit.cover,
            ),
          ),
          // Title Overlay
          Center(
            child: Text(
              'REQUEST A MECHANIC',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
          // Pay Button
          Positioned(
            bottom: 20,
            left: 20,
            right: 20,
            child: ElevatedButton(
              onPressed: () {
                // Handle button press
                // You can add your payment logic here
              },
              child: Text('PAY'),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: 'Notifications',
          ),
        ],
        onTap: (int index) {
          if (index == 0) {
            // Redirect to the homepage
            Navigator.of(context).popUntil((route) => route.isFirst);
          } else if (index == 1) {
            // Navigate to the search page
            // Add your navigation logic here
          } else if (index == 2) {
            // Navigate to the notifications page
            // Add your navigation logic here
          }
        },
      ),
    );
  }
}
