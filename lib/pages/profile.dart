import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import '../beranda.dart';
import 'voting.dart';
import '../login.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Profil",
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
                    Navigator.pushReplacement(
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
                  icon: const Icon(Icons.person, color: Color(0xFFB71C1C), size: 30),
                  onPressed: () {
                    // Halaman tetap di profil
                  },
                ),
              ],
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const VotingPage()),
          );
        },
        backgroundColor: const Color(0xFFB71C1C),
        child: const Icon(Icons.how_to_vote, color: Colors.white, size: 30),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const CircleAvatar(
              radius: 50,
              backgroundColor: Colors.grey,
              child: Icon(Icons.person, size: 50, color: Colors.white),
            ),
            const SizedBox(height: 10),
            const Text("User123345", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            const Text("4337855201230005", style: TextStyle(fontSize: 16, color: Colors.grey)),
            const SizedBox(height: 20),
            _profileMenuItem(Icons.person, "Lihat Profil", () {}),
            _profileMenuItem(Icons.notifications, "Notifikasi", () {}),
            const Spacer(),
            Align(
              alignment: Alignment.centerLeft,
              child: TextButton.icon(
                onPressed: () {
                  _showLogoutAlert(context);
                },
                icon: const Icon(Icons.logout, color: Color(0xFFB71C1C)),
                label: const Text("Keluar", style: TextStyle(color: Color(0xFFB71C1C))),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _profileMenuItem(IconData icon, String title, VoidCallback onTap) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: const Color(0xFFB71C1C),
          child: Icon(icon, color: Colors.white),
        ),
        title: Text(title, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
        trailing: const Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
        onTap: onTap,
      ),
    );
  }

  void _showLogoutAlert(BuildContext context) {
    Alert(
      context: context,
      type: AlertType.warning,
      title: "Yakin ingin keluar ?",
      desc: "Pastikan kembali keputusan anda",
      style: AlertStyle(
        isCloseButton: false,
        isOverlayTapDismiss: false,
        titleStyle: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        descStyle: TextStyle(fontSize: 16, color: Colors.grey),
      ),
      buttons: [
        DialogButton(
          child: Text("Tidak", style: TextStyle(color: Colors.white, fontSize: 18)),
          onPressed: () => Navigator.pop(context),
          color: Colors.red,
        ),
        DialogButton(
          child: Text("Yakin", style: TextStyle(color: Colors.white, fontSize: 18)),
          onPressed: () {
            Navigator.pop(context);
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => LoginPage()),
            );
          },
          color: Colors.green,
        ),
      ],
    ).show();
  }
}
