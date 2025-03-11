import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'dart:async';
import 'profilKandidat.dart'; // Import halaman profil kandidat
import 'pilihan.dart'; // Import halaman pilihan

class KandidatPage extends StatefulWidget {
  const KandidatPage({super.key});

  @override
  _KandidatPageState createState() => _KandidatPageState();
}

class _KandidatPageState extends State<KandidatPage> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    Timer.periodic(const Duration(seconds: 5), (timer) {
      if (_pageController.hasClients) {
        setState(() {
          _currentPage = (_currentPage + 1) % 4; // 4 karena ada 4 halaman
        });
        _pageController.animateToPage(
          _currentPage,
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeInOut,
        );
      }
    });
  }

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
          icon: const Icon(Icons.arrow_back, color: Color(0xFFB71C1C), size: 40),
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.how_to_vote, color: Color(0xFFB71C1C), size: 40),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const PilihPage()),
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
              "Hasil Sementara",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            SizedBox(
              height: 220,
              child: PageView(
                controller: _pageController,
                physics: const NeverScrollableScrollPhysics(),
                children: [
                  hasilSementaraCard("Jumlah Suara BEM Universisty"),
                  hasilSementaraCard("Jumlah Suara BEM FHS"),
                  hasilSementaraCard("Jumlah Suara BEM FICT"),
                  hasilSementaraCard("Jumlah Suara BEM FMB"),
                ],
              ),
            ),
            const SizedBox(height: 20),
            _buildCandidateSection("Kandidat BEM FICT"),
            _buildCandidateSection("Kandidat BEM FHS"),
          ],
        ),
      ),
    );
  }

  Widget hasilSementaraCard(String title) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 2,
            blurRadius: 5,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
          const SizedBox(height: 10),
          SizedBox(
            height: 150,
            child: BarChart(
              BarChartData(
                barGroups: [
                  makeBarData("rehan", 350, Colors.red),
                  makeBarData("ira", 180, Colors.yellow),
                  makeBarData("bintang", 220, Colors.green),
                ],
                borderData: FlBorderData(show: false),
                gridData: FlGridData(show: false),
                titlesData: FlTitlesData(
                  leftTitles: AxisTitles(
                    sideTitles: SideTitles(showTitles: true, reservedSize: 40),
                  ),
                  bottomTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      getTitlesWidget: (double value, TitleMeta meta) {
                        switch (value.toInt()) {
                          case 0:
                            return const Text("Rehan", style: TextStyle(fontSize: 12));
                          case 1:
                            return const Text("Ira", style: TextStyle(fontSize: 12));
                          case 2:
                            return const Text("Bintang", style: TextStyle(fontSize: 12));
                          default:
                            return const Text("");
                        }
                      },
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  BarChartGroupData makeBarData(String nama, double y, Color color) {
    int x;
    switch (nama) {
      case "rehan":
        x = 0;
        break;
      case "ira":
        x = 1;
        break;
      case "bintang":
        x = 2;
        break;
      default:
        x = 0;
    }
    return BarChartGroupData(
      x: x,
      barRods: [
        BarChartRodData(toY: y, color: color, width: 20, borderRadius: BorderRadius.circular(4)),
      ],
    );
  }

  Widget _buildCandidateSection(String title) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 20),
        Text(title, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        const SizedBox(height: 10),
        Row(
          children: [
            Flexible(child: _buildCandidateCard()),
            const SizedBox(width: 10),
            Flexible(child: _buildCandidateCard()),
          ],
        ),
      ],
    );
  }

  Widget _buildCandidateCard() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 5)],
      ),
      child: Column(
        children: [
          Container(
            height: 120,
            decoration: BoxDecoration(
              color: const Color(0xFFB71C1C),
              borderRadius: const BorderRadius.vertical(top: Radius.circular(10)),
              image: const DecorationImage(
                image: AssetImage('assets/images/profile.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text("Bintang Aditya", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                const SizedBox(height: 5),
                const Text("\"Membangun BEM yang Inklusif dan Progresif\"", style: TextStyle(color: Colors.grey)),
                const SizedBox(height: 10),
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const ProfilKandidatPage()),
                      );
                    },
                    child: const Text("Lihat Detail", style: TextStyle(color: Color(0xFFB71C1C))),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
