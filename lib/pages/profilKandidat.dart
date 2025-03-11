import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class ProfilKandidatPage extends StatefulWidget {
  const ProfilKandidatPage({super.key});

  @override
  _ProfilKandidatPageState createState() => _ProfilKandidatPageState();
}

class _ProfilKandidatPageState extends State<ProfilKandidatPage> {
  final TextEditingController _namaController = TextEditingController();
  final TextEditingController _nimController = TextEditingController();

  void _showInputDialog(BuildContext context) {
    Alert(
      context: context,
      title: "",
      content: Column(
        children: <Widget>[
          Image.asset('assets/images/Vector.png', height: 50),
          const SizedBox(height: 10),
          TextField(
            controller: _namaController,
            decoration: const InputDecoration(
              labelText: 'Nama Lengkap',
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 10),
          TextField(
            controller: _nimController,
            decoration: const InputDecoration(
              labelText: 'NIM',
              border: OutlineInputBorder(),
            ),
          ),
        ],
      ),
      buttons: [
        DialogButton(
          onPressed: () {
            if (_namaController.text == 'kholis' && _nimController.text == '8945857201230056') {
              Navigator.pop(context);
              Navigator.pushNamed(context, '/pilihan');
            } else {
              Alert(
                context: context,
                type: AlertType.error,
                title: "Nama dan NIM tidak sesuai",
                buttons: [
                  DialogButton(
                    child: const Text("OK", style: TextStyle(color: Colors.white, fontSize: 18)),
                    onPressed: () => Navigator.pop(context),
                    color: Color(0xFFB71C1C),
                  )
                ],
              ).show();
            }
          },
          child: const Text("Pilih Kandidat", style: TextStyle(color: Colors.white, fontSize: 18)),
          color: Color(0xFFB71C1C),
        )
      ],
    ).show();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          "Profil Kandidat",
          style: TextStyle(color: Color(0xFFB71C1C), fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Color(0xFFB71C1C), size: 30),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      Container(
                        height: 200,
                        decoration: const BoxDecoration(
                          color: Color(0xFFB71C1C),
                          image: DecorationImage(
                            image: AssetImage('assets/images/Hui.png'),
                            fit: BoxFit.cover,
                            opacity: 0.2,
                          ),
                          borderRadius: BorderRadius.vertical(bottom: Radius.circular(20)),
                        ),
                      ),
                      Positioned(
                        bottom: -10,
                        child: ClipRRect(
                          borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
                          child: Image.asset(
                            'assets/images/profile.png',
                            width: 200,
                            height: 200,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Text(
                      "Bintang Aditya",
                      style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      children: const [
                        Icon(Icons.school, color: Colors.black, size: 20),
                        SizedBox(width: 8),
                        Text("Prodi Sistem Informasi", style: TextStyle(color: Colors.black, fontSize: 14)),
                      ],
                    ),
                  ),
                  const SizedBox(height: 5),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      children: const [
                        Icon(Icons.calendar_today, color: Colors.black, size: 20),
                        SizedBox(width: 8),
                        Text("Angkatan 2023", style: TextStyle(color: Colors.black, fontSize: 14)),
                      ],
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Divider(color: Color(0xFFB71C1C), thickness: 2),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Text(
                      "Pengalaman Organisasi",
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                    child: Text("- Ketua BEM 2024\n- Sekretaris Himpunan Mahasiswa 2023"),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Text(
                      "Visi dan Misi",
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Text(
                      "Visi:\nMewujudkan BEM yang inklusif, progresif, dan berorientasi pada kepentingan mahasiswa."
                          "\nMewujudkan BEM yang inklusif, progresif,"
                          "\nMewujudkan BEM yang inklusif, progresif,\n"
                          "\n Misi:\n- Mengembangkan program-program inovatif,\n- Meningkatkan keterlibatan Mahasiswa\n- Memperkuat kerjasama dengan stakeholders"
                          "\n- Mengembangkan program-program inovatif"
                          "\n- Mengembangkan program-program inovatif"
                          "\n- Mengembangkan program-program inovatif"
                          "\n- Mengembangkan program-program inovatif"
                          "\n- Mengembangkan program-program inovatif"
                          "\n- Mengembangkan program-program inovatif \n\n",
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: ElevatedButton(
              onPressed: () => _showInputDialog(context),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFB71C1C),
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(vertical: 14),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
              ),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.how_to_vote, size: 30, color: Colors.white),
                  SizedBox(width: 8),
                  Text("Pilih Kandidat", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
