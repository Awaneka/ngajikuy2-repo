import 'package:flutter/material.dart';

class PresensiPage extends StatefulWidget {
  final String data;
  const PresensiPage({required this.data, super.key});

  @override
  _PresensiPageState createState() => _PresensiPageState();
}

class _PresensiPageState extends State<PresensiPage> {
  // Sample data for students and their attendance statuses
  final List<Map<String, dynamic>> students = [
    {"name": "Anik Setyawati", "status": "hadir"},
    {"name": "Wahyu", "status": "hadir"},
    {"name": "Awanto", "status": "hadir"},
    {"name": "Bupang", "status": "hadir"},
    {"name": "Trisul", "status": "hadir"},
    {"name": "Ichaqo", "status": "hadir"},
    {"name": "Salsabillar", "status": "hadir"},
    {"name": "Ekodono", "status": "hadir"},
  ];

  // Method to change the status of a student
  void _changeStatus(int index, String status) {
    setState(() {
      students[index]["status"] = status;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Presensi'),
        backgroundColor: Colors.blue,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Column(
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(16.0),
            color: Colors.blue,
            child: const Text(
              'Absensi santri',
              style: TextStyle(
                fontSize: 18,
                color: Colors.white,
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.all(16.0),
            padding: const EdgeInsets.all(12.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12.0),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 2,
                  blurRadius: 5,
                  offset: const Offset(0, 3),
                ),
              ],
            ),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Laporan Kehadiran',
                  style: TextStyle(fontWeight: FontWeight.bold, color: Colors.purple),
                ),
                Text('Presensi', style: TextStyle(color: Colors.blue)),
                Icon(Icons.calendar_today, color: Colors.blue),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildStatusButton('Hadir', Colors.green),
                _buildStatusButton('Ijin', Colors.yellow),
                _buildStatusButton('Bolos', Colors.red),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: students.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(
                    '${index + 1}. ${students[index]["name"]}',
                    style: const TextStyle(color: Colors.blue),
                  ),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      _buildStatusCircle('hadir', Colors.green, index),
                      _buildStatusCircle('ijin', Colors.yellow, index),
                      _buildStatusCircle('bolos', Colors.red, index),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
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
        currentIndex: 1,
        onTap: (index) {
          // Handle tab change
        },
      ),
    );
  }

  Widget _buildStatusButton(String label, Color color) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
      onPressed: () {},
      child: Text(
        label,
        style: const TextStyle(color: Colors.white),
      ),
    );
  }

  Widget _buildStatusCircle(String status, Color color, int index) {
    return GestureDetector(
      onTap: () => _changeStatus(index, status),
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 4.0),
        width: 24,
        height: 24,
        decoration: BoxDecoration(
          color: students[index]["status"] == status ? color : Colors.grey.shade300,
          shape: BoxShape.circle,
        ),
      ),
    );
  }
}
