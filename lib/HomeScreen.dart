
import 'package:flutter/material.dart';
import 'package:navigation/ComponentsScreen.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, //đổi màu nền
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/logo.png', width: 170, height: 170),
            SizedBox(height: 10),
            Text(
                'Jetpack Compose',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            SizedBox(height: 20),
            SizedBox(
              width: 300,
              child: Text(
                  'Jetpack Compose is a modern UI toolkit for building native Android applications using a declarative programming approach.',
                  style: TextStyle(fontSize: 18),
                  textAlign: TextAlign.center,
              ),
            ),
            SizedBox(height: 350),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                minimumSize: Size(400, 50), // Làm nút dài hơn (400px x 50px)
              ),
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ComponentsScreen()),
              ),
              child: Text(
                "I'm ready",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),


            ),
          ],
        ),
      ),
    );
  }
}