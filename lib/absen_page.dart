import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class AbsenPage extends StatefulWidget {
  @override
  _AbsenPageState createState() => _AbsenPageState();
}

class _AbsenPageState extends State<AbsenPage> {
  bool _isCheckedIn = false;

  void _checkIn() async {
    setState(() {
      _isCheckedIn = true;
    });
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Absen masuk berhasil')),
    );

    const url = 'https://maps.app.goo.gl/C7siFR5U3UN1kxEn7';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  void _checkOut() {
    setState(() {
      _isCheckedIn = false;
    });
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Absen keluar berhasil')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Halaman Absen'),
        backgroundColor: Color(0xFF41B06E),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              _isCheckedIn
                  ? 'Anda sudah absen masuk'
                  : 'Anda belum absen masuk',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: !_isCheckedIn ? _checkIn : null,
              style: ElevatedButton.styleFrom(
                backgroundColor: !_isCheckedIn ? Colors.green : Colors.grey,
                padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
              ),
              child: Text('Absen Masuk'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _isCheckedIn ? _checkOut : null,
              style: ElevatedButton.styleFrom(
                backgroundColor: _isCheckedIn ? Colors.red : Colors.grey,
                padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
              ),
              child: Text('Absen Keluar'),
            ),
          ],
        ),
      ),
    );
  }
}
