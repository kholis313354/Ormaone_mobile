import 'package:flutter/material.dart';
import '../beranda.dart';
import 'profile.dart';
import 'kandidat.dart';

class VotingPage extends StatelessWidget {
  const VotingPage({super.key});

  final List<String> votingItems = const [
    "Pemilihan Ketua BEM Universitas 2025",
    "Pemilihan Ketua BEM FICT 2025",
    "Pemilihan Ketua BEM FHS 2025",
    "Pemilihan Ketua BEM FMB 2025",
    "Pemilihan Ketua BLM FICT 2025",
    "Pemilihan Ketua BLM FHS 2025",
    "Pemilihan Ketua BLM FMB 2025",
    "Pemilihan Ketua HIMA FICT 2025",
    "Pemilihan Ketua HIMA FHS 2025",
    "Pemilihan Ketua HIMA FMB 2025",
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
            Column(
              mainAxisSize: MainAxisSize.min,
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
              ],
            ),
            const SizedBox(width: 40),
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
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
        padding: const EdgeInsets.all(16.0),
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
        margin: const EdgeInsets.only(bottom: 12),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        elevation: 4,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Icon(Icons.how_to_vote, color: Color(0xFFB71C1C), size: 30),
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                          color: Color(0xFFB71C1C),
                          fontWeight: FontWeight.bold,
                          fontSize: 18),
                    ),
                    const SizedBox(height: 5),
                    Row(
                      children: const [
                        Icon(Icons.people, color: Colors.grey, size: 16),
                        SizedBox(width: 5),
                        Text("500 Mahasiswa", style: TextStyle(color: Colors.grey)),
                        SizedBox(width: 10),
                        Icon(Icons.calendar_today, color: Colors.grey, size: 16),
                        SizedBox(width: 5),
                        Text("01 - 07 September 2025", style: TextStyle(color: Colors.grey)),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
