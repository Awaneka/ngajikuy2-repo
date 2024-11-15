import 'package:flutter/material.dart';

import 'agenda_screen.dart';
import 'hafalan_screen.dart';
import 'iqro_screen.dart';
import 'kelas_screen.dart';
import 'kelasvirtual_screen.dart';
import 'profil_screen.dart';

class MenuPage extends StatelessWidget {
  final String data;
  const MenuPage({required this.data, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('NgajiYok'),
        backgroundColor: Colors.blue, // Sesuaikan dengan tema warna
        automaticallyImplyLeading: false, // Menghilangkan tombol back
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Header dengan latar belakang masjid
            Stack(
              children: [
                Container(
                  height: 250,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/masjid.jpg'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 40), // Jarak dari atas
                      const Text(
                        'Assalamu’alaikum, sahabat TPQ',
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 5),
                      const Text(
                        'Muhammad Wahyu',
                        style: TextStyle(
                          fontSize: 26,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 20),
                      Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 142, 135, 135).withOpacity(0.8),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: const Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'NGAJI YOK',
                              style: TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                                color: Colors.purple,
                              ),
                            ),
                            SizedBox(height: 5),
                            Text(
                              'MASJID BAITURRAHMAN',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.black87,
                              ),
                            ),
                            SizedBox(height: 5),
                            Text(
                              'Senin 26, April 2026\nAsar 15:15 WIB\n01:30:44 Menjelang Azan',
                              style: TextStyle(
                                  fontSize: 16, color: Colors.black87),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            // Menu Ikon
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20.0),
              child: GridView.count(
                crossAxisCount: 3,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                padding: const EdgeInsets.all(10),
                children: [
                  _buildMenuItem(context, Icons.school, 'Kelas'),
                  _buildMenuItem(context, Icons.event_note, 'Agenda'),
                  _buildMenuItem(context, Icons.book, 'Hafalan'),
                  _buildMenuItem(context, Icons.menu_book, 'Iqro'),
                  _buildMenuItem(context, Icons.camera_alt, 'Kelas Virtual'),
                  _buildMenuItem(context, Icons.account_circle, 'Akun'),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Beranda',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.school),
            label: 'Kelas',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profil',
          ),
        ],
        currentIndex: 0, // Set Beranda sebagai halaman aktif
        selectedItemColor: Colors.blue,
        onTap: (index) {
          // Handle navigasi antar halaman
        },
      ),
    );
  }

  // Fungsi untuk membuat item menu dengan navigasi
  Widget _buildMenuItem(BuildContext context, IconData icon, String label) {
    return GestureDetector(
      onTap: () {
        // Navigasi ke halaman sesuai label
        if (label == 'Kelas') {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const ClassScreen(data: ''),
            ),
          );
        } else if (label == 'Akun') {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const ProfileScreen(
                ProfilScreen: '',
                userName: '',
              ),
            ),
          );
        } else if (label == 'Iqro') {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const IqroScreen(),
            ),
          );
        } else if (label == 'Hafalan') {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const HafalanScreen(),
            ),
          );
        } else if (label == 'Agenda') {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AgendaScreen(data: ''),
            ),
          );
        } else if (label == 'Kelas Virtual') {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const VirtualClassScreen(),
            ),
          );
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Anda menekan $label')),
          );
        }
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 50, color: Colors.blue),
          const SizedBox(height: 10),
          Text(
            label,
            style: const TextStyle(fontSize: 16),
          ),
        ],
      ),
    );
  }
}
