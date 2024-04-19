import 'package:flutter/material.dart';
import 'cart.dart';

// Define a Service class to represent each service
class Service {
  final String name;
  final double price;
  final IconData icon;

  Service({required this.name, required this.price, required this.icon});
}

class ServicePage extends StatefulWidget {
  @override
  _ServicePageState createState() => _ServicePageState();
}

class _ServicePageState extends State<ServicePage> {
  // List to hold selected services
  List<Service> selectedServices = [];
  double totalPrice = 0.0;

  // Function to handle service selection
  void _selectService(Service service) {
    setState(() {
      selectedServices.add(service);
      totalPrice += service.price;
    });
  }

  // Function to navigate to the cart screen
  void _navigateToCart() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => CartPage(selectedServices, totalPrice)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'TIME SAVING SHOP', // Set the title to "TIME SAVING SHOP"
          textAlign: TextAlign.center, // Align text to the center
        ),
      ),
      backgroundColor: Colors.transparent, // Make scaffold background transparent
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/auto-repair-3691962.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: EdgeInsets.all(10.0),
          child: ListView(
            children: [
              _buildRowWithSpaces([
                _buildServiceButton(Service(name: 'Brake Pads', price: 5000, icon: Icons.settings), Colors.orange),
              ]),
              SizedBox(height: 10),
              _buildRowWithSpaces([
                _buildServiceButton(Service(name: 'Spark Plugs', price: 2000, icon: Icons.bolt), Colors.purple),
              ]),
              SizedBox(height: 10),
              _buildRowWithSpaces([
                _buildServiceButton(Service(name: 'Air Filter', price: 1000, icon: Icons.filter_alt), Colors.blue),
              ]),
              SizedBox(height: 10),
              _buildRowWithSpaces([
                _buildServiceButton(Service(name: 'Oil Filter', price: 1500, icon: Icons.local_car_wash), Colors.green),
              ]),
              SizedBox(height: 10),
              _buildRowWithSpaces([
                _buildServiceButton(Service(name: 'Wiper Blades', price: 2000, icon: Icons.settings_backup_restore), Colors.teal),
              ]),
              SizedBox(height: 10),
              _buildRowWithSpaces([
                _buildServiceButton(Service(name: 'Battery', price: 5000, icon: Icons.battery_charging_full), Colors.yellow),
              ]),
              SizedBox(height: 10),
              _buildRowWithSpaces([
                _buildServiceButton(Service(name: 'Tires', price: 8000, icon: Icons.directions_car), Colors.indigo),
              ]),
              SizedBox(height: 10),
              _buildRowWithSpaces([
                _buildServiceButton(Service(name: 'Engine Oil', price: 3000, icon: Icons.local_gas_station), Colors.red),
              ]),
              SizedBox(height: 10),
              _buildRowWithSpaces([
                _buildServiceButton(Service(name: 'Fuel Filter', price: 2000, icon: Icons.ev_station), Colors.orangeAccent),
              ]),
              SizedBox(height: 10),
              _buildRowWithSpaces([
                _buildServiceButton(Service(name: 'Transmission Fluid', price: 4000, icon: Icons.settings_ethernet), Colors.purpleAccent),
              ]),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              icon: Icon(Icons.home),
              onPressed: () {
                // Navigate to home screen
                Navigator.pushNamedAndRemoveUntil(context, '/', (route) => false);
              },
            ),
            IconButton(
              icon: Icon(Icons.shopping_cart),
              onPressed: _navigateToCart,
            ),
            IconButton(
              icon: Icon(Icons.send),
              onPressed: () {
                // Submit functionality
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRowWithSpaces(List<Widget> children) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: children,
      ),
    );
  }

  Widget _buildServiceButton(Service service, Color color) {
    return Expanded(
      flex: 1,
      child: ElevatedButton(
        onPressed: () {
          _selectService(service); // Call the function to handle service selection
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              service.icon,
              size: 40,
              color: Colors.white,
            ),
            SizedBox(height: 5),
            Text(
              service.name,
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 5),
            Text(
              'TSH ${service.price}',
              style: TextStyle(
                color: Colors.white,
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

