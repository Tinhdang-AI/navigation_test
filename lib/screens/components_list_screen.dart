import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'text_detail_screen.dart'; // Import màn hình chi tiết

class ComponentListScreen extends StatefulWidget {
  @override
  _ComponentListScreenState createState() => _ComponentListScreenState();
}

class _ComponentListScreenState extends State<ComponentListScreen> {
  Future<List<dynamic>> fetchTasks() async {
    final response = await http.get(Uri.parse('https://amock.io/api/researchUTH/tasks'));

    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);
      return jsonData['data'];
    } else {
      throw Exception('Failed to load tasks');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Task List",
          style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.blue),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: FutureBuilder<List<dynamic>>(
          future: fetchTasks(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(child: Text("Error: ${snapshot.error}"));
            } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
              return Center(child: Text("No tasks available"));
            }

            List<dynamic> tasks = snapshot.data!;
            return ListView.builder(
              itemCount: tasks.length,
              itemBuilder: (context, index) {
                return _buildComponentCard(
                  context,
                  tasks[index]['title'],
                  tasks[index]['description'],
                  tasks[index]['subtasks'] ?? [], // Lấy subtasks hoặc danh sách rỗng
                );
              },
            );
          },
        ),
      ),
    );
  }

  Widget _buildComponentCard(BuildContext context, String title, String description, List<dynamic> subtasks) {
    return Card(
      color: Colors.blue.shade100,
      margin: EdgeInsets.symmetric(vertical: 4),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListTile(
              title: Text(
                title,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text(description),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => TextDetail(title: title, description: description),
                  ),
                );
              },
            ),
            if (subtasks.isNotEmpty) ...[
              Divider(),
              Text("Subtasks:", style: TextStyle(fontWeight: FontWeight.bold)),
              Column(
                children: subtasks.map((subtask) {
                  return ListTile(
                    leading: Icon(
                      subtask['isCompleted'] ? Icons.check_circle : Icons.radio_button_unchecked,
                      color: subtask['isCompleted'] ? Colors.green : Colors.red,
                    ),
                    title: Text(subtask['title']),
                  );
                }).toList(),
              ),
            ]
          ],
        ),
      ),
    );
  }
}
