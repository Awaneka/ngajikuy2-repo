import 'package:flutter/material.dart';

class AdminMenuPage extends StatelessWidget {
  final String data;
  const AdminMenuPage({required this.data, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Admin Menu'),
        backgroundColor: Colors.blue, // Differentiate admin section with red color
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16.0),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(bottom: Radius.circular(20)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 5,
                    offset: Offset(0, 2),
                  ),
                ],
              ),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'NGAJI YOK',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.purple,
                    ),
                  ),
                  Text(
                    'MASJID BAITURRAHMAN\nSenin 26, April 2026\nAsar 15:15 WIB',
                    style: TextStyle(fontSize: 16),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Pengajar',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.purple,
              ),
            ),
            const SizedBox(height: 10),
            GridView.count(
              crossAxisCount: 3,
              padding: const EdgeInsets.all(10),
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              shrinkWrap: true, // Ensure the GridView is sized based on its children
              children: [
                _buildMenuButton(context, 'Presensi', Icons.assignment, '/adminPresensi'),
                _buildMenuButton(context, 'Progres Hafalan', Icons.bar_chart, '/adminProgresHafalan'),
                _buildMenuButton(context, 'Kelas', Icons.school, '/adminKelas'),
                _buildMenuButton(context, 'Kelas Virtual', Icons.video_call, '/adminKelasVirtual'),
                _buildMenuButton(context, 'Progres Iqro', Icons.book, '/adminProgresIqro'),
                _buildMenuButton(context, 'Akun', Icons.account_circle, '/adminAkun'),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Pengajar',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Admin',
          ),
        ],
        currentIndex: 2, // Set the default selected tab as Admin
        onTap: (index) {
          // Handle navigation between tabs here if needed
        },
      ),
    );
  }

  Widget _buildMenuButton(BuildContext context, String label, IconData icon, String route) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, route);
      },
      child: Column(
        children: [
          Container(
            width: 70,
            height: 70,
            decoration: const BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 5,
                  offset: Offset(2, 2),
                ),
              ],
            ),
            child: Icon(icon, size: 40, color: Colors.blue),
          ),
          const SizedBox(height: 8),
          Text(label, style: const TextStyle(fontSize: 14)),
        ],
      ),
    );
  }
}
