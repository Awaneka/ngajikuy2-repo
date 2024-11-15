import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AdminKelasPage extends StatefulWidget {
  AdminKelasPage({super.key});

  @override
  _AdminKelasPageState createState() => _AdminKelasPageState();
}

class _AdminKelasPageState extends State<AdminKelasPage> {
  final List<String> students = [
    'Anik Setyawati',
    'Wahyu',
    'Awanto',
    'Bupang',
    'Trisul',
    'Ichaqo',
    'Salsabillar',
    'Ekodono',
  ];

  final TextEditingController _studentController = TextEditingController();

  // Fungsi untuk menambah siswa baru ke Firestore
  Future<void> _addStudentToFirestore(String studentName) async {
    await FirebaseFirestore.instance.collection('santri').add({
      'name': studentName,
    });
    setState(() {
      students.add(studentName);
    });
    _studentController.clear(); // Kosongkan field input setelah menambah
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Kelas'),
        backgroundColor: Colors.blue,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {
              // Tampilkan dialog untuk menambah siswa baru
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  title: const Text('Tambah Siswa'),
                  content: TextField(
                    controller: _studentController,
                    decoration: const InputDecoration(
                      hintText: 'Masukkan nama siswa',
                    ),
                  ),
                  actions: [
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context); // Tutup dialog
                      },
                      child: const Text('Batal'),
                    ),
                    TextButton(
                      onPressed: () {
                        if (_studentController.text.isNotEmpty) {
                          _addStudentToFirestore(_studentController.text);
                        }
                        Navigator.pop(context); // Tutup dialog setelah menambah
                      },
                      child: const Text('Tambah'),
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Daftar Nama Santri',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.blueAccent,
              ),
            ),
            const SizedBox(height: 10),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.blue[50],
                borderRadius: BorderRadius.circular(20),
              ),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Nama Santri',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.purple,
                        ),
                      ),
                    ],
                  ),
                  Icon(Icons.calendar_today, size: 40),
                ],
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.search),
                hintText: 'Cari santri...',
                fillColor: Colors.purple[50],
                filled: true,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
            const SizedBox(height: 20),
            ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: students.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4.0),
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      '${index + 1}. ${students[index]}',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    ),
                  ),
                );
              },
            ),
          ],
        ),
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
          // Navigasi tab
        },
      ),
    );
  }
}
