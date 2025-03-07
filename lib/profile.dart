import 'package:flutter/material.dart';

class VotingPage extends StatelessWidget {
  const VotingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Pemilihan Aktif",
          style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.red),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.red,
        unselectedItemColor: Colors.grey,
        currentIndex: 1,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Beranda"),
          BottomNavigationBarItem(icon: Icon(Icons.how_to_vote), label: "Voting"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profil"),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: 4,
          itemBuilder: (context, index) {
            return votingCard();
          },
        ),
      ),
    );
  }

  Widget votingCard() {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.red,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Expanded(
                child: Text(
                  "Pemilihan Ketua BEM Universitas 2025",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ),
              Icon(Icons.groups, color: Colors.white),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            children: const [
              Icon(Icons.people, color: Colors.white, size: 16),
              SizedBox(width: 5),
              Text("500 Mahasiswa", style: TextStyle(color: Colors.white)),
            ],
          ),
          const SizedBox(height: 5),
          Row(
            children: const [
              Icon(Icons.calendar_today, color: Colors.white, size: 16),
              SizedBox(width: 5),
              Text("01 - 07 September 2025", style: TextStyle(color: Colors.white)),
            ],
          ),
        ],
      ),
    );
  }
}
