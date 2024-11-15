import 'package:flutter/material.dart';

class AdminProgresHafalanPage extends StatelessWidget {
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

  AdminProgresHafalanPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Hafalan Santri'),
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
            margin: const EdgeInsets.all(16.0),
            padding: const EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              color: Colors.blue[100],
              borderRadius: BorderRadius.circular(16),
            ),
            child: const Row(
              children: [
                Text(
                  'Laporan Kemajuan Hafalan',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                Spacer(),
                Text(
                  'Progres Hafalan',
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue),
                ),
                Icon(Icons.calendar_today),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.search),
                hintText: 'Search',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: students.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(students[index]),
                  trailing: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              StudentDetailPage(studentName: students[index]),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                    child: const Text('Detail'),
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
      ),
    );
  }
}

class StudentDetailPage extends StatefulWidget {
  final String studentName;

  const StudentDetailPage({super.key, required this.studentName});

  @override
  _StudentDetailPageState createState() => _StudentDetailPageState();
}

class _StudentDetailPageState extends State<StudentDetailPage> {
  List<Map<String, dynamic>> surahs = [
    {'name': 'Surat Al-Fatihah', 'status': 'Lulus'},
    {'name': 'Surat An-Nas', 'status': 'Lulus'},
    {'name': 'Surat Al-Falaq', 'status': 'Lulus'},
    {'name': 'Surat Al-Ikhlas', 'status': 'Mengulang'},
    {'name': 'Surat Al-Lahab', 'status': 'Mengulang'},
    {'name': 'Surat Al-Nasr', 'status': 'Lulus'},
    {'name': 'Surat Al-Kafirun', 'status': 'Mengulang'},
    {'name': 'Surat Al-Kautsar', 'status': 'Mengulang'},
  ];

  void _updateStatus(int index) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Update Status'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: ['Lulus', 'Mengulang'].map((status) {
              return ListTile(
                title: Text(status),
                onTap: () {
                  setState(() {
                    surahs[index]['status'] = status;
                  });
                  Navigator.pop(context);
                },
              );
            }).toList(),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hafalan Santri ${widget.studentName}'),
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
            margin: const EdgeInsets.all(16.0),
            padding: const EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              color: Colors.blue[100],
              borderRadius: BorderRadius.circular(16),
            ),
            child: Row(
              children: [
                const Text(
                  'Laporan Kemajuan Hafalan Santri',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                const Spacer(),
                Text(
                  'Hafalan Santri ${widget.studentName}',
                  style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue),
                ),
                const Icon(Icons.calendar_today),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: surahs.length,
              itemBuilder: (context, index) {
                final surah = surahs[index];
                return ListTile(
                  leading: const Icon(Icons.book),
                  title: Text(surah['name']),
                  subtitle: Text(surah['status'],
                      style: TextStyle(
                        color: surah['status'] == 'Lulus'
                            ? Colors.green
                            : Colors.red,
                        fontWeight: FontWeight.bold,
                      )),
                  trailing: IconButton(
                    icon: const Icon(Icons.edit),
                    onPressed: () => _updateStatus(index),
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
      ),
    );
  }
}
