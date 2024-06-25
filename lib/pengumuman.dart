import 'package:flutter/material.dart';

class PengumumanPage extends StatelessWidget {
  final List<Map<String, String>> pengumumanList = [
    {
      'imagePath': 'images/perusahaan.jpg',
      'judul': 'Visi Misi Perusahaan',
      'isi': 'Visi\n'
          'Menjadi pemimpin global dalam inovasi teknologi ramah lingkungan, menciptakan masa depan yang berkelanjutan dan sejahtera bagi generasi mendatang.\n\n'
          'Misi\n'
          '1. Inovasi: Mengembangkan teknologi ramah lingkungan.\n'
          '2. Kualitas: Memberikan produk berkualitas tinggi.\n'
          '3. Kemitraan: Membangun kolaborasi untuk teknologi hijau.\n'
          '4. Pemberdayaan: Mendukung inovasi dan pengembangan karyawan.\n'
          '5. Komunitas: Berkontribusi melalui tanggung jawab sosial.\n'
          '6. Kesadaran: Meningkatkan edukasi tentang teknologi hijau.',
      'tanggal': '12 Mei 2024',
    },
    {
      'imagePath': 'images/gambar1.png',
      'judul': 'Rekrutmen Karyawan Baru',
      'isi': '1. Pendidikan\n'
          '- Administratif: D3\n'
          '- Teknis/profesional: S1\n'
          '- Manajerial: S1, S2 lebih diutamakan\n\n'
          '2. Pengalaman Kerja\n'
          '- Entry-level: Tidak perlu\n'
          '- Menengah: 2-5 tahun\n'
          '- Senior: 5-10 tahun\n\n'
          '3. Keterampilan\n'
          '- Teknis: Alat/perangkat lunak terkait\n'
          '- Interpersonal: Komunikasi, kerja tim\n\n'
          '4. Sertifikasi\n'
          '- Profesional yang relevan (CPA, PMP)\n\n'
          '5. Kesesuaian Budaya\n'
          '- Integritas, kerja keras, inovasi\n\n'
          '6. Kesehatan\n'
          '- Fisik dan mental memadai\n\n'
          '7. Legalitas\n'
          '- KTP/paspor, NPWP, bersih dari catatan kriminal\n\n'
          '8. Referensi\n'
          '- Dua referensi profesional\n\n'
          '9. Bahasa\n'
          '- Indonesia: Baik\n'
          '- Inggris: Menengah/mahir (jika diperlukan)\n\n'
          '10. Komitmen\n'
          '- Mengikuti kebijakan perusahaan, beradaptasi dengan perubahan.',
      'tanggal': '13 Mei 2024',
    },
    {
      'imagePath': 'images/disiplin1.png', // Gambar lokal
      'judul': 'Kedisiplinan Karyawan',
      'isi': '1. Karyawan diharapkan hadir tepat waktu sesuai dengan jam kerja yang telah ditetapkan.\n'
          '- Jika ada keperluan mendesak yang mengakibatkan keterlambatan, karyawan harus memberi tahu atasan atau bagian HR terlebih dahulu.\n'
          '- Kedisiplinan dan etika berpakaian.\n\n'
          '2. Karyawan diwajibkan berpakaian rapi dan sesuai dengan kode berpakaian perusahaan.\n'
          '- Pakaian yang tidak pantas atau berpotensi mengganggu lingkungan kerja tidak diizinkan.\n\n'
          '3. Fasilitas Kantor.\n'
          '- Karyawan harus merawat fasilitas kantor dan peralatan dengan baik.\n'
          '- Penggunaan fasilitas seperti telepon dan internet harus relevan dengan tugas pekerjaan.\n'
          '- Kerahasiaan dan keamanan informasi perusahaan dan klien.\n\n'
          '4. Karyawan harus menjaga kerahasiaan informasi perusahaan dan pelanggan.\n'
          '- Tidak diperbolehkan untuk mengungkapkan informasi rahasia kepada pihak luar tanpa izin.\n\n'
          '5. Komitmen terhadap kualitas kerja.\n'
          '- Karyawan diharapkan menyelesaikan tugas dengan baik dan sesuai standar perusahaan.\n'
          '- Kritik dan saran yang membangun untuk meningkatkan kualitas kerja selalu disambut.\n\n'
          '6. Ketidakhadiran dan izin.\n'
          '- Karyawan harus memberi tahu atasan atau HR jika tidak dapat hadir bekerja karena sakit atau alasan pribadi yang sah.\n'
          '- Izin cuti harus diajukan dengan waktu yang cukup dan harus disetujui oleh atasan.\n\n'
          '7. Hormat dan keharmonisan di tempat kerja.\n'
          '- Karyawan diwajibkan berkomunikasi dengan sopan dan menghargai pendapat rekan kerja.\n'
          '- Tindakan yang dapat menciptakan ketegangan atau konflik di tempat kerja harus dihindari.\n\n',
      'tanggal': '13 Mei 2024',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pengumuman'),
        backgroundColor: Color(0xFF41B06E),
      ),
      body: ListView.builder(
        padding: EdgeInsets.all(16.0),
        itemCount: pengumumanList.length,
        itemBuilder: (context, index) {
          final pengumuman = pengumumanList[index];
          return Card(
            margin: EdgeInsets.only(bottom: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: pengumuman['imagePath']!.startsWith('http')
                      ? Image.network(
                          pengumuman['imagePath']!,
                          fit: BoxFit.cover,
                          height: 200,
                          width: double.infinity,
                        )
                      : Image.asset(
                          pengumuman['imagePath']!,
                          fit: BoxFit.cover,
                          height: 200,
                          width: double.infinity,
                        ),
                ),
                Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Text(
                    pengumuman['judul']!,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                  child: Text(
                    pengumuman['isi']!,
                    style: TextStyle(fontSize: 16),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        pengumuman['tanggal']!,
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: PengumumanPage(),
  ));
}
