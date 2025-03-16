import 'package:flutter/material.dart';
import 'package:navigation/DetailScreen.dart';


class ComponentsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'UI Components List',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
      ),

      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSectionTitle('Display'),
            _buildComponentsCard('Text', 'Display text', context),
            _buildComponentsCard('Image', 'Display an images', context),

            _buildSectionTitle('Input'),
            _buildComponentsCard('TextField', 'Input field for text', context),
            _buildComponentsCard(
                'Password', 'Input field for password', context),

            _buildSectionTitle('Layout'),
            _buildComponentsCard(
                'Column', 'Arrange elements vertically', context),
            _buildComponentsCard(
                'Row', 'Arrange elements horizontally', context),
          ],


        ),
      ),
    );
  }

  /// Tạo tiêu đề cho từng nhóm
  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(top: 16.0, bottom: 8.0),
      child: Text(
        title,
        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
    );
  }

  // Tạo card hiển thị component
  Widget _buildComponentsCard(String title, String description, BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Xử lý khi card được nhấn
        Navigator.push(
            context,
            MaterialPageRoute(
            builder: (context) => DetailScreen(title: title, description: description),
            ),
        );
      },
      child: Container(
        width: double.infinity, // Đặt chiều rộng cho card
        margin: EdgeInsets.symmetric(vertical: 6),
        padding: EdgeInsets.all(12),
        decoration:  BoxDecoration(
          color: Colors.lightBlue[100],
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title,style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            SizedBox(height: 4),
            Text(description, style: TextStyle(fontSize: 14)),
          ],
        ),
      ),
    );

  }
}
