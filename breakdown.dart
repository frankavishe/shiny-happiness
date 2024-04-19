import 'package:flutter/material.dart';

class BreakdownPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Breakdown Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Image taking up 50% of the page
            Expanded(
              flex: 2,
              child: Image.asset(
                'assets/breakdown1.jpg', // Replace 'your_image.png' with the path to your image asset
                fit: BoxFit.cover,
              ),
            ),
            // Text widget
            Expanded(
              flex: 1,
              child: Center(
                child: Text('CAR BREAKDOWN DESCRIPTION'),
              ),
            ),
            // Car recovery description
            Expanded(
              flex: 1,
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: Text(
                  'Car recovery services are specialized services that assist drivers whose vehicles have broken down or encountered an accident on the road. When a car becomes immobilized and cannot be driven safely to its destination, a recovery service is called in to tow or transport the vehicle to a nearby garage, repair shop, or another designated location. These services often use tow trucks, flatbed trucks, or other specialized vehicles to handle the transportation of the disabled car. Car recovery services are valuable for providing assistance to drivers in distress and ensuring their vehicles are safely taken care of during such situations.',
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            // Price
            Text(
              'Price: Tsh 5000',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            // Pay Button
            ElevatedButton(
              onPressed: () {
                // Add functionality for payment here
              },
              child: Text('PAY'),
            ),
          ],
        ),
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
        onTap: (index) {
          if (index == 0) {
            // Redirect to homepage here
            Navigator.of(context).popUntil((route) => route.isFirst);
          } else if (index == 1) {
            // Add functionality for search navigation item
          } else if (index == 2) {
            // Add functionality for notifications navigation item
          }
        },
      ),
    );
  }
}
