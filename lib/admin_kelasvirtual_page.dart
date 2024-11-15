import 'package:flutter/material.dart';

class AdminKelasvirtualPage extends StatelessWidget {
  const AdminKelasvirtualPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Kelas Virtual'),
        backgroundColor: Colors.blue,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Container(
                height: 100,
                decoration: BoxDecoration(
                  color: Colors.blue[100],
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              const SizedBox(height: 20),
              const Icon(Icons.school, size: 100),
              const SizedBox(height: 20),
              TextField(
                decoration: InputDecoration(
                  labelText: 'Nama kelas',
                  labelStyle: const TextStyle(
                      color: Colors.purple, fontWeight: FontWeight.bold),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  filled: true,
                  fillColor: Colors.grey[200],
                ),
              ),
              const SizedBox(height: 20),
              TextField(
                decoration: InputDecoration(
                  labelText: 'Kode akses',
                  labelStyle: const TextStyle(
                      color: Colors.purple, fontWeight: FontWeight.bold),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  filled: true,
                  fillColor: Colors.grey[200],
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  // Navigasi ke halaman VirtualMeetingPage
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const VirtualMeetingPage(),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                ),
                child:
                    const Text('Buat kelas', style: TextStyle(color: Colors.white)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class VirtualMeetingPage extends StatelessWidget {
  const VirtualMeetingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Meeting Room'),
        backgroundColor: Colors.blue,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.videocam, size: 100, color: Colors.blue),
                  SizedBox(width: 20),
                  Icon(Icons.videocam_off, size: 100, color: Colors.grey),
                ],
              ),
              const SizedBox(height: 20),
              const Text(
                'Kelas Virtual: Nama Kelas',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
              Text(
                'Kode Akses: 123456',
                style: TextStyle(fontSize: 16, color: Colors.grey[700]),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  // Tambahkan logika untuk bergabung ke kelas virtual di sini
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                child: const Text('Bergabung', style: TextStyle(color: Colors.white)),
              ),
              const SizedBox(height: 20),
              // Daftar peserta dengan scroll jika melebihi layar
              ListView.builder(
                shrinkWrap: true, // Agar tidak mengambil seluruh tinggi layar
                physics:
                    const NeverScrollableScrollPhysics(), // Menggunakan SingleChildScrollView untuk scrolling
                itemCount: 10, // Ubah sesuai jumlah peserta sebenarnya
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: const CircleAvatar(
                      child: Icon(Icons.person),
                    ),
                    title: Text('Peserta ${index + 1}'),
                    subtitle: const Text('Status: Online'),
                    trailing: const Icon(Icons.mic, color: Colors.blue),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
