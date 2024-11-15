import 'package:flutter/material.dart';

class VerificationAdminPage extends StatelessWidget {
  final String data;
  const VerificationAdminPage({required this.data, super.key});
 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Icon(
              Icons.check_circle,
              color: Colors.blue,
              size: 150,
            ),
            const SizedBox(height: 20),
            const Text(
              'SELAMAT VERIFIKASI BERHASIL',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 40),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                backgroundColor: Colors.blue[100], // Warna background button
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20), // Membuat button rounded
                  side: const BorderSide(color: Colors.black), // Outline pada button
                ),
              ),
              onPressed: () {
                // Arahkan ke halaman selanjutnya
                Navigator.pushReplacementNamed(context, '/menu');
              },
              child: const Text(
                'LANJUT',
                style: TextStyle(
                  color: Colors.black, // Warna teks button
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
