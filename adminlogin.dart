import 'package:flutter/material.dart';


class LoginApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginPage(),
    );
  }
}

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/tires-913588.jpg'), // Replace 'background_image.jpg' with your image file
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: LoginForm(),
          ),
        ),
      ),
    );
  }
}

class LoginForm extends StatefulWidget {
  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TextField(
          controller: _emailController,
          style: TextStyle(color: Colors.white), // Set text color to white
          decoration: InputDecoration(
            labelText: 'Email or Phone',
            labelStyle: TextStyle(color: Colors.white), // Set label color to white
          ),
        ),
        SizedBox(height: 20),
        TextField(
          controller: _passwordController,
          style: TextStyle(color: Colors.white), // Set text color to white
          obscureText: true,
          decoration: InputDecoration(
            labelText: 'Password',
            labelStyle: TextStyle(color: Colors.white), // Set label color to white
          ),
        ),
        SizedBox(height: 20),
        ElevatedButton(
          onPressed: () {
            _login();
          },
          child: Text('Login'),
        ),
      ],
    );
  }

  void _login() {
    // Here you can implement your login logic
    String email = _emailController.text;
    String password = _passwordController.text;

    // Example validation: Check if email and password are not empty
    if (email.isNotEmpty && password.isNotEmpty) {
      // Perform login operation
      print('Login successful with: $email, $password');
    } else {
      // Show error message if fields are empty
      print('Please enter email/phone and password');
    }
  }
}
