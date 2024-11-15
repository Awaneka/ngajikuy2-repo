import 'package:flutter/material.dart';

class AdminWelcomePage extends StatelessWidget {
  final String data;
  const AdminWelcomePage({required this.data, super.key});
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Admin NgajiYok'),
        backgroundColor: Colors.blue, // Optional: Customize the admin theme
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Welcome, Admin NgajiYok!',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 40),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/loginAdmin');
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  minimumSize: const Size(double.infinity, 50), // Full-width button
                ),
                child: const Text('Go to Admin Login'),
              ),
              const SizedBox(height: 20),
              
              ],
          ),
        ),
      ),
    );
  }
}
