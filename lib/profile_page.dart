import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'edit_profile_page.dart';
import 'dart:io';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  String userName = '';
  String userEmail = '';
  File? _imageFile;

  @override
  void initState() {
    super.initState();
    _loadProfile();
  }

  void _loadProfile() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      userName = prefs.getString('userName') ?? 'User';
      userEmail = prefs.getString('userEmail') ?? 'email@example.com';
      String? imagePath = prefs.getString('userImage');
      if (imagePath != null) {
        _imageFile = File(imagePath);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profil'),
        backgroundColor: Color(0xFF41B06E),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountName: Text(userName),
              accountEmail: Text(userEmail),
              currentAccountPicture: CircleAvatar(
                radius: 50,
                backgroundImage: _imageFile != null
                    ? FileImage(_imageFile!)
                    : AssetImage('images/profil.jpg') as ImageProvider,
              ),
              decoration: BoxDecoration(
                color: Color(0xFF41B06E),
              ),
            ),
            ListTile(
              leading: Icon(Icons.person),
              title: Text('Profile'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ProfilePage()),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.fingerprint),
              title: Text('Absen'),
              onTap: () {
                // Navigasi ke halaman absen
              },
            ),
            ListTile(
              leading: Icon(Icons.date_range),
              title: Text('Cuti'),
              onTap: () {
                // Navigasi ke halaman cuti
              },
            ),
            ListTile(
              leading: Icon(Icons.attach_money),
              title: Text('Gaji'),
              onTap: () {
                // Navigasi ke halaman gaji
              },
            ),
            ListTile(
              leading: Icon(Icons.calendar_today),
              title: Text('Kalender'),
              onTap: () {
                // Navigasi ke halaman kalender
              },
            ),
            ListTile(
              leading: Icon(Icons.announcement),
              title: Text('Pengumuman'),
              onTap: () {
                // Navigasi ke halaman pengumuman
              },
            ),
            ListTile(
              leading: Icon(Icons.logout),
              title: Text('Keluar'),
              onTap: () {
                // Aksi logout
              },
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CircleAvatar(
              radius: 50,
              backgroundImage: _imageFile != null
                  ? FileImage(_imageFile!)
                  : AssetImage('images/profil.jpg') as ImageProvider,
            ),
            SizedBox(height: 10),
            Text(
              'Nama: $userName',
              style: TextStyle(fontSize: 20),
            ),
            Text(
              'Email: $userEmail',
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => EditProfilePage()),
                ).then((_) => _loadProfile());
              },
              child: Text('Edit Profil'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF41B06E),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
