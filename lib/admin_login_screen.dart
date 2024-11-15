import 'package:flutter/material.dart';

class AdminLoginPage extends StatelessWidget {
  final String data;
  const AdminLoginPage({required this.data, super.key});
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('LOGIN ADMIN'),
        backgroundColor: Colors.blue, // Optional: Different color for admin login page
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const TextField(
              decoration: InputDecoration(
                labelText: 'Admin Email',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            const TextField(
              decoration: InputDecoration(
                labelText: 'Password',
                border: OutlineInputBorder(),
              ),
              obscureText: true,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Simulate admin login verification
                // Replace this with your actual admin authentication logic
                bool isAuthenticated = true; // Example logic

                if (isAuthenticated) {
                  // Navigate to verification success page first
                  Navigator.pushNamed(context, '/verificationAdmin').then((_) {
                    // After verification, navigate to admin menu
                    Navigator.pushReplacementNamed(context, '/menuAdmin');
                  });
                // ignore: dead_code
                } else {
                  // Handle failed login (e.g., show error message)
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue, // Optional: Button color for admin login
              ),
              child: const Text('Login Admin'),
            ),
          ],
        ),
      ),
    );
  }
}
