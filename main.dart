import 'package:flutter/material.dart';
import 'package:garageapp/request_technician.dart';
import 'package:garageapp/services.dart';
import 'breakdown.dart';
import 'adminlogin.dart';



void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: PictureBackgroundPage(),
      routes: {
        '/breakdown': (context) => BreakdownPage(),
        '/shop': (context) => ServicePage(), // Changed route name to '/shop'
        '/request_technician': (context) => RequestTechnicianPage(),
        '/adminlogin': (context) => LoginPage(),
      },
    );
  }
}

class PictureBackgroundPage extends StatefulWidget {
  @override
  _PictureBackgroundPageState createState() => _PictureBackgroundPageState();
}

class _PictureBackgroundPageState extends State<PictureBackgroundPage> {
  String _selectedOption = 'BREAKDOWN'; // Initial selected option

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('TIME SAVING'), // Title bar with text "TIME SAVING"
        actions: <Widget>[
          // Admin button added to the app bar
          ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, '/adminlogin');

              // Action to perform when the admin button is pressed
              print('Admin button pressed!');
              // Implement any admin functionality here
            },
            child: Text('Admin Login'),
          ),
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/garage1.jpg'), // Corrected image asset path
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 80), // Increased spacing between top and title
              Text(
                'Welcome to TIMESAVING GARAGE APP', // Added text
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 28, // Bigger font size
                  color: Colors.white,
                  fontFamily: 'Arial', // Different font family
                  fontWeight: FontWeight.bold, // Bold font weight
                ),
              ),
              SizedBox(height: 40), // Increased spacing between title and subtitle
              Text(
                'FIX YOUR CAR NOW',
                style: TextStyle(
                  fontSize: 24,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 60), // Increased spacing between subtitle and dropdown menu
              DropdownButton<String>(
                value: _selectedOption,
                onChanged: (String? newValue) {
                  if (newValue != null) {
                    // Update the selected option when it changes
                    setState(() {
                      _selectedOption = newValue;
                    });
                  }
                },
                items: <String>['BREAKDOWN', 'SHOP', 'REQUEST TECHNICIAN'] // Updated dropdown items
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(
                      value,
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                      ),
                    ),
                  );
                }).toList(),
                dropdownColor: Colors.black, // Customize dropdown menu color
              ),
              SizedBox(height: 60), // Increased spacing between dropdown menu and button
              ElevatedButton(
                onPressed: () {
                  // Action to perform when the button is pressed
                  print('Submit button pressed!');

                  // Navigate to the selected page based on the dropdown value
                  switch (_selectedOption) {
                    case 'BREAKDOWN':
                      Navigator.pushNamed(context, '/breakdown');
                      break;
                    case 'SHOP': // Updated case for 'SHOP'
                      Navigator.pushNamed(context, '/shop'); // Changed route name to '/shop'
                      break;
                    case 'REQUEST TECHNICIAN':
                      Navigator.pushNamed(context, '/request_technician');
                      break;
                    default:
                    // Handle any other cases
                      break;
                  }
                },
                child: Text('Submit'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
