import 'package:flutter/material.dart';

class HafalanScreen extends StatelessWidget {
  const HafalanScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Hafalan Santri'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header
              Container(
                padding: const EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  color: Colors.blueAccent,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Row(
                  children: [
                    Icon(Icons.calendar_today, color: Colors.white, size: 30),
                    SizedBox(width: 16),
                    Text(
                      'Laporan Kemajuan Hafalan Santri',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                'Hafalan',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              
              // List Hafalan
              Column(
                children: [
                  _buildHafalanItem('Surat Al-Fatihah', true),
                  _buildHafalanItem('Surat An-Nas', true),
                  _buildHafalanItem('Surat Al-Falaq', true),
                  _buildHafalanItem('Surat Al-Ikhlas', false),
                  _buildHafalanItem('Surat Al-Lahab', false),
                  _buildHafalanItem('Surat Al-Nasr', true),
                  _buildHafalanItem('Surat Al-Kafirun', false),
                  _buildHafalanItem('Surat Al-Kautsar', false),
                ],
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Beranda',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.class_),
            label: 'Kelas',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label: 'Profil',
          ),
        ],
      ),
    );
  }

  // Widget untuk item hafalan
  Widget _buildHafalanItem(String surat, bool lulus) {
    return ListTile(
      leading: const Icon(Icons.book, size: 30),
      title: Text(surat, style: const TextStyle(fontSize: 18)),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            lulus ? Icons.check_circle : Icons.cancel,
            color: lulus ? Colors.green : Colors.red,
            size: 24,
          ),
          const SizedBox(width: 10),
          Text(
            lulus ? 'LULUS' : 'MENGULANG',
            style: TextStyle(
              fontSize: 16,
              color: lulus ? Colors.green : Colors.red,
            ),
          ),
        ],
      ),
    );
  }
}