import 'package:flutter/material.dart';
import 'beranda.dart';


class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // Controller untuk input
  final TextEditingController namaController = TextEditingController();
  final TextEditingController nimController = TextEditingController();
  final TextEditingController fakultasController = TextEditingController();

  // Data yang harus diinputkan dengan benar
  final String validNama = "kholis";
  final String validNim = "8945857201230056";
  final String validFakultas = "fict";

  // Fungsi untuk menangani login
  void _login() {
    if (namaController.text == validNama &&
        nimController.text == validNim &&
        fakultasController.text.toLowerCase() == validFakultas.toLowerCase()) {
      // Jika benar, pindah ke halaman Beranda
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => BerandaPage()),
      );
    } else {
      // Jika salah, tampilkan pesan kesalahan
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Silahkan masukkan dengan benar"),
          duration: Duration(seconds: 5),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Bagian atas dengan gambar
            Stack(
              children: [
                // Background image
                Container(
                  height: 250,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/images/background.png'), // Ganti dengan gambar header
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                // Logo di tengah
                Positioned(
                  top: 120,
                  left: 0,
                  right: 0,
                  child: Column(
                    children: [
                      Image.asset(
                        'assets/images/icon1.png', // Ganti dengan logo
                        height: 80,
                      ),
                      const SizedBox(height: 10),
                      const Text(
                        "MASUK",
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF9B1B1B), // Warna merah
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),

            const SizedBox(height: 40),

            // Formulir Input
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildTextField(controller: namaController, label: "NAMA", hint: "Masukkan Nama"),
                  _buildTextField(controller: nimController, label: "NIM", hint: "Masukkan Nomor Induk Mahasiswa"),
                  _buildTextField(controller: fakultasController, label: "FAKULTAS", hint: "Masukkan Fakultas"),
                  const SizedBox(height: 20),
                  // Tombol Masuk
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFF9B1B1B), // Warna merah
                        padding: EdgeInsets.symmetric(vertical: 14),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      onPressed: _login, // Panggil fungsi login
                      child: const Text(
                        "Masuk",
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Widget untuk membuat TextField
  Widget _buildTextField({required TextEditingController controller, required String label, required String hint}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 5),
        TextField(
          controller: controller,
          decoration: InputDecoration(
            hintText: hint,
            filled: true,
            fillColor: Color(0xFFF2F2F2), // Warna abu-abu muda
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide.none,
            ),
          ),
        ),
        const SizedBox(height: 15),
      ],
    );
  }
}
