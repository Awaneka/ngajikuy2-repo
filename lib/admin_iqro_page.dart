import 'package:flutter/material.dart';

class AdminProgresIqroPage extends StatelessWidget {
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

  AdminProgresIqroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Progress Iqro Santri'),
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
                  'Laporan Kemajuan Iqro',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                Spacer(),
                Text(
                  'Progres Iqro',
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue),
                ),
                Icon(Icons.book),
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
                          builder: (context) => StudentDetailIqroPage(
                              studentName: students[index]),
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

class StudentDetailIqroPage extends StatefulWidget {
  final String studentName;

  const StudentDetailIqroPage({super.key, required this.studentName});

  @override
  _StudentDetailIqroPageState createState() => _StudentDetailIqroPageState();
}

class _StudentDetailIqroPageState extends State<StudentDetailIqroPage> {
  List<Map<String, dynamic>> iqroProgress = [
    {'jilid': 'Jilid 1', 'progress': 0.2}, // 20%
    {'jilid': 'Jilid 2', 'progress': 0.4}, // 40%
    {'jilid': 'Jilid 3', 'progress': 0.1}, // 10%
    {'jilid': 'Jilid 4', 'progress': 0.6}, // 60%
    {'jilid': 'Jilid 5', 'progress': 0.3}, // 30%
    {'jilid': 'Jilid 6', 'progress': 0.0}, // 0%
  ];

  void _editProgress(int index) {
    double currentProgress = iqroProgress[index]['progress'] * 100;
    TextEditingController progressController = TextEditingController(
      text: currentProgress.toInt().toString(),
    );

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Edit Progress for ${iqroProgress[index]['jilid']}'),
          content: TextField(
            controller: progressController,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(
              hintText: 'Enter progress (0-100)',
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  double newProgress =
                      double.parse(progressController.text) / 100;
                  iqroProgress[index]['progress'] = newProgress.clamp(
                      0.0, 1.0); // Ensuring the value stays between 0.0 and 1.0
                });
                Navigator.pop(context);
              },
              child: const Text('Save'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detail Progres Iqro - ${widget.studentName}'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Progres Tadarus Iqro',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: ListView.builder(
                itemCount: iqroProgress.length,
                itemBuilder: (context, index) {
                  final jilid = iqroProgress[index]['jilid'];
                  final progress = iqroProgress[index]['progress'];
                  return Card(
                    margin: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  jilid,
                                  style: const TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(height: 8),
                                LinearProgressIndicator(
                                  value: progress,
                                  backgroundColor: Colors.grey[300],
                                  color: Colors.blue,
                                  minHeight: 8,
                                ),
                                const SizedBox(height: 8),
                                Text(
                                  'Progres: ${(progress * 100).toInt()}%',
                                  style: const TextStyle(fontSize: 16),
                                ),
                              ],
                            ),
                          ),
                          IconButton(
                            icon: const Icon(Icons.edit),
                            onPressed: () {
                              _editProgress(index);
                            },
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
