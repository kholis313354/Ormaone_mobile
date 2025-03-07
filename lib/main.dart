import 'package:flutter/material.dart';
import 'dart:async';
import 'login.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const LoadingScreen(),
    );
  }
}

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({super.key});

  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 5), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const OnboardingScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red[800],
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/icon3.png',
              width: 300,
              errorBuilder: (context, error, stackTrace) => const Icon(
                Icons.error,
                size: 500,
                color: Colors.white,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: Image.asset(
                'assets/images/pms.png',
                width: 1700,
                errorBuilder: (context, error, stackTrace) => const Icon(
                  Icons.error,
                  size: 100,
                  color: Colors.white,
                ),
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              " ",
              style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Opacity(
              opacity: 0.3,
              child: Image.asset(
                'assets/images/background.png',
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) => Container(
                  color: Colors.grey[300], // Placeholder jika gambar tidak ditemukan
                ),
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/icon1.png',
                width: 100,
                errorBuilder: (context, error, stackTrace) => const Icon(
                  Icons.error,
                  size: 100,
                  color: const Color(0xA01D1DFF),
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                "Satu aplikasi untuk semua kebutuhan Ormaone",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.red),
              ),
              const Padding(
                padding: EdgeInsets.all(16.0),
                child: Text(
                  "Satu aplikasi untuk semua kebutuhan organisasi mahasiswa! Kelola acara, koordinasi anggota, pengumuman, dan administrasi dengan mudah dalam satu platform terpadu.",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 16, color: Colors.black54),
                ),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                onPressed: () {
                  // Navigasi ke halaman login.dart
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => LoginPage()), // Gantilah dengan nama class LoginPage
                  );
                },
                child: const Text(
                  "Mulai",
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
