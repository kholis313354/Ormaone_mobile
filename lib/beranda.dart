import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'dart:async';
import 'pages/voting.dart';
import 'pages/profile.dart';

class BerandaPage extends StatefulWidget {
  const BerandaPage({super.key});

  @override
  _BerandaPageState createState() => _BerandaPageState();
}

class _BerandaPageState extends State<BerandaPage> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    Timer.periodic(const Duration(seconds: 5), (Timer timer) {
      if (_currentPage < 3) { // 4 halaman total (0 - 3)
        _currentPage++;
      } else {
        _currentPage = 0;
      }
      _pageController.animateToPage(
        _currentPage,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        notchMargin: 8.0,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              icon: const Icon(Icons.home, color: Color(0xFFB71C1C), size: 30),
              onPressed: () {},
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
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const VotingPage()),
          );
        },
        backgroundColor: const Color(0xFFB71C1C),
        child: const Icon(Icons.how_to_vote, color: Colors.white, size: 30),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Image.asset('assets/images/icon1.png', height: 40),
                        const SizedBox(width: 10),
                        const Text(
                          "OrmaOne",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFFB71C1C),
                          ),
                        ),
                      ],
                    ),
                    IconButton(
                      icon: const Icon(Icons.notifications, size: 28, color: Colors.grey),
                      onPressed: () {},
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                const Text(
                  "Hasil Sementara",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Color(0xFFB71C1C)),
                ),
                const SizedBox(height: 10),
                SizedBox(
                  height: 220,
                  child: PageView(
                    controller: _pageController,
                    physics: const NeverScrollableScrollPhysics(),
                    children: [
                      hasilSementaraCard("Jumlah Suara BEM University"),
                      hasilSementaraCard("Jumlah Suara BLM FHS"),
                      hasilSementaraCard("Jumlah Suara BLM FICT"),
                      hasilSementaraCard("Jumlah Suara BLM FMB"),
                      hasilSementaraCard("Jumlah Suara BEM FMB"),
                      hasilSementaraCard("Jumlah Suara BEM FICT "),
                      hasilSementaraCard("Jumlah Suara BEM FHS "),
                      hasilSementaraCard("Jumlah Suara HIMA FICT "),
                      hasilSementaraCard("Jumlah Suara HIMA FHS "),
                      hasilSementaraCard("Jumlah Suara HIMA FMB ")
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                const Text("Kandidat BEM Universitas", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                const SizedBox(height: 10),
                GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 0.8,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                  ),
                  itemCount: 4,
                  itemBuilder: (context, index) {
                    return kandidatCard();
                  },
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
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
                  makeBarData("Rehan", 350, Colors.red),
                  makeBarData("Ira", 180, Colors.yellow),
                  makeBarData("Bintang", 220, Colors.green),
                ],
                titlesData: FlTitlesData(
                  leftTitles: AxisTitles(sideTitles: SideTitles(showTitles: true, reservedSize: 40)),
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
                borderData: FlBorderData(show: false),
                gridData: FlGridData(show: false),
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
      case "Rehan":
        x = 0;
        break;
      case "Ira":
        x = 1;
        break;
      case "Bintang":
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

  Widget kandidatCard() {
    return Container(
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
        children: [
          Image.asset('assets/images/kandidat.png', height: 160, width: double.infinity, fit: BoxFit.cover),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Column(
              children: [
                Text("Bintang Aditya", style: TextStyle(fontWeight: FontWeight.bold)),
                Text("\"Membangun BEM yang Inklusif dan Progresif\"", style: TextStyle(fontSize: 12, color: Color(0xFFA3A3A3))),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
