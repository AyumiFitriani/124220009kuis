import 'package:flutter/material.dart';
import 'loginpage.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Get screen size to determine layout for larger screens (like web)
    final screenSize = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail Fakultas'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment
              .spaceBetween, // Space between content and button
          children: [
            Expanded(
              // Use Expanded to take available space
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Gambar persegi
                    Center(
                      child: Container(
                        width: 150,
                        height: 150,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          image: const DecorationImage(
                            image: AssetImage('assets/upn.jpg'),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    // Deskripsi fakultas
                    const Text(
                      'Arah Pendidikan',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Text(
                      'Arah pendidikan UPN ”Veteran” Yogyakarta adalah mengembangkan ilmu pengetahuan dan teknologi yang dilandasi oleh nilai-nilai kedisiplinan, kejuangan, kreativitas, keunggulan, kebangsaan, dan kejujuran dalam rangka menunjang pembangunan nasional melalui bidang pendidikan tinggi dalam rangka terciptanya sumber daya manusia yang unggul di era global dengan dilandasi jiwa bela negara.\n\n'
                      'Tujuan Pendidikan\n\n'
                      'Pendidikan di UPN ”Veteran” Yogyakarta bertujuan untuk:\n'
                      '1. Menyelenggarakan pendidikan dan pengajaran yang berkualitas guna menghasilkan lulusan berdaya saing global yang memiliki jiwa disiplin, berdaya juang, kreatif, serta berwawasan kebangsaan dan mampu menjadi komponen pendukung dalam sistem pertahanan negara;\n\n'
                      '2. Meningkatkan kuantitas dan kualitas penelitian guna:\n'
                      'a. Menunjang pengembangan mutu pendidikan dan pengajaran;\n'
                      'b. Mengembangkan dan menerapkan ilmu pengetahuan dan teknologi (IPTEK) untuk menunjang pengabdian kepada masyarakat; dan\n'
                      'c. Menghasilkan modal intelektual dan karya ilmiah dalam rangka menunjang pembangunan nasional; dan\n\n'
                      '3. Pengembangan kegiatan pengabdian kepada masyarakat melalui:\n'
                      'a. Penyediaan layanan ilmu pengetahuan dan teknologi (IPTEK) dalam rangka meningkatkan kesejahteraan masyarakat;\n'
                      'b. Peningkatan keberdayaan masyarakat; dan\n'
                      'c. Peningkatan reputasi UPN ”Veteran” Yogyakarta.',
                      style: TextStyle(fontSize: 16),
                    ),
                  ],
                ),
              ),
            ),
            // Logout button positioned at the bottom center
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(
                  horizontal: screenSize.width > 600
                      ? 32
                      : 16, // Larger padding for web
                  vertical:
                      screenSize.width > 600 ? 16 : 8, // Taller button for web
                ),
                textStyle: TextStyle(
                  fontSize:
                      screenSize.width > 600 ? 20 : 14, // Larger text for web
                ),
              ),
              onPressed: () {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            const LoginPage())); // Navigate back to login page
              },
              child: const Text("LOGOUT"),
            ),
          ],
        ),
      ),
    );
  }
}
