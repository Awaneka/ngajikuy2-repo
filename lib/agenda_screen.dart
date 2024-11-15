import 'package:flutter/material.dart';
import 'menu_page.dart'; // Impor HomeScreen

class AgendaScreen extends StatelessWidget {
  final String data;
  const AgendaScreen({required this.data, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Agenda'),
        backgroundColor: const Color.fromARGB(255, 35, 115, 204),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context); // Kembali ke halaman sebelumnya
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.calendar_today),
            onPressed: () {
              // Aksi untuk melihat kalender
            },
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.lightBlue.shade50,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Chip(
                            label: const Text('Senin'),
                            backgroundColor: Colors.blue.shade200,
                          ),
                          const SizedBox(width: 5),
                          Chip(
                            label: const Text('Rabu'),
                            backgroundColor: Colors.green.shade200,
                          ),
                          const SizedBox(width: 5),
                          Chip(
                            label: const Text('Jum\'at'),
                            backgroundColor: Colors.teal.shade200,
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      const Text(
                        'JADWAL TPQ',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.green,
                        ),
                      ),
                      const SizedBox(height: 5),
                      const Text(
                        'Jangan sampai lupa ya, teman-teman!',
                        style: TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),
              _buildAgendaCard(
                day: 'Hari Senin',
                teacher: 'Ustadz Tegar',
                activity: 'Belajar membaca iqro',
                iconPath: 'assets/images/book_icon.png',
              ),
              _buildAgendaCard(
                day: 'Hari Rabu',
                teacher: 'Ustadz Awan',
                activity: 'Belajar membaca iqro',
                iconPath: 'assets/images/book_icon.png',
              ),
              _buildAgendaCard(
                day: 'Hari Jum\'at',
                teacher: 'Ustadz Wahyu',
                activity: 'Kegiatan Ekstrakurikuler',
                iconPath: 'assets/images/activity_icon.png',
              ),
              const SizedBox(height: 20),
              const Text(
                'Informasi',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                child: const Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Jum\'at Asik',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.green,
                        ),
                      ),
                      SizedBox(height: 8),
                      Text('• Jum\'at Pertama: Olahraga'),
                      Text('• Jum\'at Kedua: Praktek Sholat dan Wudhu'),
                      Text('• Jum\'at Ketiga: Outing Class'),
                      Text('• Jum\'at Keempat: Belajar Kaligrafi'),
                      Text('• Jum\'at Kelima: Berkisah'),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                color: Colors.lightBlue.shade100,
                child: const ListTile(
                  leading: Icon(Icons.book, size: 40, color: Colors.blue),
                  title: Text(
                    'Kajian Tafsir Al-Quran',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  subtitle: Text(
                    'Masjid Baiturrahman\nMinggu, 10 Juli 2024 17.00-18.00',
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 1, // Pilih index yang sesuai untuk Agenda
        onTap: (index) {
          if (index == 0) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => MenuPage(data: '')),
            );
          } else if (index == 1) {
            // Sudah di halaman Agenda
          } else if (index == 2) {
            // Tambahkan navigasi ke halaman Profil jika ada
          }
        },
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
            icon: Icon(Icons.person),
            label: 'Profil',
          ),
        ],
        selectedItemColor: const Color.fromARGB(255, 35, 115, 204),
        unselectedItemColor: Colors.grey,
      ),
    );
  }

  // Fungsi untuk membuat kartu agenda
  Widget _buildAgendaCard({
    required String day,
    required String teacher,
    required String activity,
    required String iconPath,
  }) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: ListTile(
        leading: CircleAvatar(
          backgroundImage: AssetImage(iconPath),
          radius: 25,
        ),
        title: Text(
          teacher,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Text(activity),
        trailing: Text(day, style: const TextStyle(color: Colors.black54)),
      ),
    );
  }
}
