import 'package:flutter/material.dart';
import '../beranda.dart';
import 'profile.dart';
import 'kandidat.dart';

class VotingPage extends StatelessWidget {
  const VotingPage({super.key});

  final List<String> votingItems = const [
    "Pemilihan Ketua BEM Universitas 2025",
    "Pemilihan Ketua BEM Fakultas 2025",
    "Pemilihan Ketua BLM 2025",
    "Pemilihan Ketua HIMA Fakultas 2025",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Pemilihan Aktif",
          style: TextStyle(color: Color(0xFFB71C1C), fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Color(0xFFB71C1C)),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        notchMargin: 8.0,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              icon: const Icon(Icons.home, color: Colors.grey, size: 30),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const BerandaPage()),
                );
              },
            ),
            const SizedBox(width: 40),
            IconButton(
              icon: const Icon(Icons.person, color: Colors.grey, size: 30),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ProfilePage()),
                );
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: const Color(0xFFB71C1C),
        child: const Icon(Icons.how_to_vote, color: Colors.white, size: 30),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        child: ListView.builder(
          itemCount: votingItems.length,
          itemBuilder: (context, index) {
            return votingCard(context, votingItems[index]);
          },
        ),
      ),
    );
  }

  Widget votingCard(BuildContext context, String title) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => KandidatPage()),
        );
      },
      child: Card(
        margin: const EdgeInsets.only(bottom: 16),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        elevation: 4,
        child: Container(
          height: 150, // Ukuran card diperbesar
          decoration: BoxDecoration(
            color: const Color(0xFFB71C1C), // Warna merah
            borderRadius: BorderRadius.circular(12),
            image: const DecorationImage(
              image: AssetImage('assets/images/Hui.png'), // Background gambar vote.png
              fit: BoxFit.cover,
              opacity: 0.2,
            ),
          ),
          padding: const EdgeInsets.all(16.0),
          child: Stack(
            children: [
              // Konten teks dan ikon bawah
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Row(
                    children: const [
                      Icon(Icons.people, color: Colors.white, size: 16),
                      SizedBox(width: 5),
                      Text("500 Mahasiswa", style: TextStyle(color: Colors.white)),
                      SizedBox(width: 15),
                      Icon(Icons.calendar_today, color: Colors.white, size: 16),
                      SizedBox(width: 5),
                      Text("01 - 07 September 2025", style: TextStyle(color: Colors.white)),
                    ],
                  ),
                ],
              ),
              // Ikon vote di kanan atas
              Positioned(
                right: 0,
                top: 0,
                child: Icon(Icons.how_to_vote, color: Colors.white, size: 30),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
