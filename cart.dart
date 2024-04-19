import 'package:flutter/material.dart';
import 'package:garageapp/services.dart';

class CartPage extends StatefulWidget {
  final List<Service> selectedServices;
  final double totalPrice;

  CartPage(this.selectedServices, this.totalPrice);

  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  late List<Service> _selectedServices;
  double _totalPrice = 0;

  @override
  void initState() {
    super.initState();
    _selectedServices = widget.selectedServices;
    _totalPrice = widget.totalPrice;
  }

  void _removeService(int index) {
    setState(() {
      _totalPrice -= _selectedServices[index].price;
      _selectedServices.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Shopping Cart'),
      ),
      body: ListView.builder(
        itemCount: _selectedServices.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(_selectedServices[index].name),
            subtitle: Text('TSH ${_selectedServices[index].price}'),
            trailing: IconButton(
              icon: Icon(Icons.remove_shopping_cart),
              onPressed: () {
                _removeService(index);
              },
            ),
          );
        },
      ),
      bottomNavigationBar: BottomAppBar(
        child: ListTile(
          title: Text(
            'Total: TSH $_totalPrice',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          trailing: ElevatedButton(
            onPressed: () {
              // Implement checkout functionality
            },
            child: Text('Checkout'),
          ),
        ),
      ),
    );
  }
}
