import 'package:flutter/material.dart';

class DetailScreen extends StatelessWidget {
  final String title;
  final String description;

  DetailScreen({required this.title, required this.description});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title, style: TextStyle(fontWeight: FontWeight.bold)),
        centerTitle: true,
        backgroundColor: _getAppBarColor(title), // AppBar color based on component
      ),
      body: _buildDetailContent(title, description), // Content changes per component
      backgroundColor: _getBackgroundColor(title), // Background color customization
    );
  }

  /// **Build different views based on the component type**
  Widget _buildDetailContent(String title, String description) {
    switch (title) {
      case 'Text':
        return _buildTextDetail(description);
      case 'Image':
        return _buildImageDetail();
      case 'TextField':
        return _buildTextFieldDetail();
      case 'Password':
        return _buildPasswordDetail();
      case 'Column':
        return _buildColumnDetail();
      case 'Row':
        return _buildRowDetail();
      default:
        return _buildDefaultDetail(description);
    }
  }

  /// **Text Component Detail**
  Widget _buildTextDetail(String description) {
    return Center(
      child: Text(
        description,
        style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.black87),
        textAlign: TextAlign.center,
      ),
    );
  }

  /// **Image Component Detail**
  Widget _buildImageDetail() {
    return Center(
      child: Image.asset(
        'assets/logo_tieu.jpg', // Replace with actual image
        width: 200,
        height: 200,
        fit: BoxFit.cover,
      ),
    );
  }

  /// **TextField Component Detail**
  Widget _buildTextFieldDetail() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: TextField(
        decoration: InputDecoration(
          labelText: 'Enter text',
          border: OutlineInputBorder(),
        ),
      ),
    );
  }

  /// **Password Component Detail**
  Widget _buildPasswordDetail() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: TextField(
        obscureText: true,
        decoration: InputDecoration(
          labelText: 'Enter password',
          border: OutlineInputBorder(),
          suffixIcon: Icon(Icons.visibility),
        ),
      ),
    );
  }

  /// **Column Component Detail**
  Widget _buildColumnDetail() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.view_column, size: 50, color: Colors.blue),
          SizedBox(height: 10),
          Text('This is a Column layout', style: TextStyle(fontSize: 18)),
        ],
      ),
    );
  }

  /// **Row Component Detail**
  Widget _buildRowDetail() {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.view_column, size: 50, color: Colors.green),
          SizedBox(width: 10),
          Text('This is a Row layout', style: TextStyle(fontSize: 18)),
        ],
      ),
    );
  }

  /// **Default Detail Page (Fallback)**
  Widget _buildDefaultDetail(String description) {
    return Center(
      child: Text(description, style: TextStyle(fontSize: 18)),
    );
  }

  /// **AppBar Color Based on Component**
  Color _getAppBarColor(String title) {
    switch (title) {
      case 'Text':
        return Colors.blue;
      case 'Image':
        return Colors.orange;
      case 'TextField':
      case 'Password':
        return Colors.purple;
      case 'Column':
        return Colors.green;
      case 'Row':
        return Colors.red;
      default:
        return Colors.black;
    }
  }

  /// **Background Color Based on Component**
  Color _getBackgroundColor(String title) {
    switch (title) {
      case 'Text':
        return Colors.blue[50]!;
      case 'Image':
        return Colors.orange[50]!;
      case 'TextField':
      case 'Password':
        return Colors.purple[50]!;
      case 'Column':
        return Colors.green[50]!;
      case 'Row':
        return Colors.red[50]!;
      default:
        return Colors.white;
    }
  }
}
