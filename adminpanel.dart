import 'package:flutter/material.dart';




class AdminPanelApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Admin Panel',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: AdminPanelHomePage(),
    );
  }
}

class AdminPanelHomePage extends StatefulWidget {
  @override
  _AdminPanelHomePageState createState() => _AdminPanelHomePageState();
}

class _AdminPanelHomePageState extends State<AdminPanelHomePage> {
  String _displayedContent = '';

  void _setDisplayContent(String content) {
    setState(() {
      _displayedContent = content;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Admin Panel'),
      ),
      body: Row(
        children: <Widget>[
          Container(
            width: 200.0, // Adjust width as needed
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/breakdown1.jpg'), // Replace 'background_image.jpg' with your image file
                fit: BoxFit.cover,
              ),
            ),
            child: ListView(
              children: <Widget>[
                ListTile(
                  title: ElevatedButton(
                    onPressed: () {
                      _setDisplayContent('Manage Users Content');
                    },
                    child: Text('Manage Users'),
                  ),
                ),
                Divider(),
                ListTile(
                  title: ElevatedButton(
                    onPressed: () {
                      _setDisplayContent('Manage Products Content');
                    },
                    child: Text('Manage Products'),
                  ),
                ),
                Divider(),
                ListTile(
                  title: ElevatedButton(
                    onPressed: () {
                      _setDisplayContent('Manage Orders Content');
                    },
                    child: Text('Manage Orders'),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(width: 20), // Adding space between the columns
          Expanded(
            child: Container(
              color: Colors.white,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    _displayedContent,
                    style: TextStyle(fontSize: 20.0),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
