import 'package:flutter/material.dart';

class AbsenSiswaPage extends StatelessWidget {
  final String data;
  const AbsenSiswaPage({required this.data, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Absen Siswa'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context); // Navigate back to the previous screen
          },
        ),
      ),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                const Text(
                  'Laporan Kehadiran',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Presensi',
                      style: TextStyle(fontSize: 18),
                    ),
                    Icon(Icons.calendar_today),
                  ],
                ),
                const SizedBox(height: 20),
                // Calendar representation
                _buildCalendar(),
              ],
            ),
          ),
          Expanded(
            child: Column(
              children: [
                // Add a breakdown of presence data
                _buildPresenceSummary(),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 1, // Index of Kelas tab
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
        onTap: (index) {
          if (index == 0) {
            // Navigate to Home
            Navigator.pushNamedAndRemoveUntil(context, '/', (route) => false);
          } else if (index == 2) {
            // Navigate to Profile
            Navigator.pushNamed(context, '/profile');
          }
        },
      ),
    );
  }

  // Calendar Widget
  Widget _buildCalendar() {
    // Simulating a calendar (can be enhanced with a package)
    return Table(
      children: [
        TableRow(children: [
          _buildCalendarDay('MIN', ''),
          _buildCalendarDay('SEN', '1', isPresent: true),
          _buildCalendarDay('SEL', '2'),
          _buildCalendarDay('RAB', '3', isPresent: true),
          _buildCalendarDay('KAM', '4'),
          _buildCalendarDay('JUM', '5', isPresent: true),
          _buildCalendarDay('SAB', '6'),
        ]),
        TableRow(children: [
          _buildCalendarDay('', ''),
          _buildCalendarDay('7', '', isAlpha: true),
          _buildCalendarDay('8', 'Alpha', isAlpha: true),
          _buildCalendarDay('9', 'Present', isPresent: true),
          _buildCalendarDay('10', 'Present', isPresent: true),
          _buildCalendarDay('11', 'Present', isPresent: true),
          _buildCalendarDay('12', 'Present', isPresent: true),
        ]),
        // Continue for more rows as needed...
      ],
    );
  }

  Widget _buildCalendarDay(String label, String number,
      {bool isPresent = false, bool isAlpha = false}) {
    Color backgroundColor = Colors.transparent;
    if (isPresent) backgroundColor = Colors.green;
    if (isAlpha) backgroundColor = Colors.red;

    return Container(
      margin: const EdgeInsets.all(4),
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        children: [
          Text(label),
          if (number.isNotEmpty)
            Text(
              number,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
        ],
      ),
    );
  }

  Widget _buildPresenceSummary() {
    return const Padding(
      padding: EdgeInsets.all(16.0),
      child: Column(
        children: [
          Text('Jumlah Masuk : 11 Hari', style: TextStyle(fontSize: 16)),
          SizedBox(height: 8),
          Text('Jumlah Ijin : 1 Hari', style: TextStyle(fontSize: 16)),
          SizedBox(height: 8),
          Text('Jumlah Alpha : 2 Hari', style: TextStyle(fontSize: 16)),
        ],
      ),
    );
  }
}
