// Import the necessary files
import 'package:flutter/material.dart';
import 'lengthConvert.dart';
import 'weightConvert.dart';
import 'forceConvert.dart';
import 'volumeConvert.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Conversion Warehouse',
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
            color: Colors.red,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.blue[900],
      ),
      body: Center(
        child: GridView.count(
          crossAxisCount: 2,
          padding: EdgeInsets.all(16),
          mainAxisSpacing: 20,
          crossAxisSpacing: 20,
          children: <Widget>[
            _buildBox(context, 'Length', Colors.red),
            _buildBox(context, 'Weight', Colors.blue),
            _buildBox(context, 'Force/Torque', Colors.green),
            _buildBox(context, 'Volume/Fluids', Colors.yellow),
          ],
        ),
      ),
    );
  }

  Widget _buildBox(BuildContext context, String text, Color color) {
    return GestureDetector(
      onTap: () {
        _navigateToPage(context, text);
      },
      child: Container(
        width: 120,
        height: 80,
        color: color,
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              fontSize: 20,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }

  void _navigateToPage(BuildContext context, String pageName) {
    switch (pageName) {
      case 'Length':
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => lengthConvert()));
        break;
      case 'Weight':
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => weightConvert()));
        break;
      case 'Force/Torque':
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => forceConvert()));
        break;
      case 'Volume/Fluids':
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => volumeConvert()));
        break;
    }
  }
}
