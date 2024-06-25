import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'login_screen.dart';
import 'pengumuman.dart';
import 'kalender.dart';
import 'cuti_page.dart';
import 'absen_page.dart';
import 'profile_page.dart';
import 'gaji_page.dart'; // Import the gaji page

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String userName = '';

  @override
  void initState() {
    super.initState();
    _loadUserName();
  }

  void _loadUserName() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      userName = prefs.getString('userName') ?? 'User';
    });
  }

  final List<String> menu = [
    "Absen",
    "Cuti",
    "Gaji",
    "Kalender",
    "Pengumuman",
    "Profile"
  ];

  final List<Color> warnaMenu = [
    Color(0xFF41B06E),
    Color(0xFF41B06E),
    Color(0xFF41B06E),
    Color(0xFF41B06E),
    Color(0xFF41B06E),
    Color(0xFF41B06E),
  ];

  final List<Icon> iconMenu = const [
    Icon(Icons.fingerprint, color: Colors.white, size: 30),
    Icon(Icons.calendar_today, color: Colors.white, size: 30),
    Icon(Icons.money, color: Colors.white, size: 30),
    Icon(Icons.calendar_month_outlined, color: Colors.white, size: 30),
    Icon(Icons.newspaper, color: Colors.white, size: 30),
    Icon(Icons.person, color: Colors.white, size: 30),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF41B06E),
        elevation: 0,
        leading: Builder(
          builder: (context) => IconButton(
            icon: Icon(Icons.view_sidebar, size: 30, color: Colors.white),
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
          ),
        ),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Color(0xFF41B06E),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(
                    radius: 30,
                    backgroundImage: AssetImage('images/profil.jpg'),
                  ),
                  SizedBox(height: 10),
                  Text(
                    userName,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                    ),
                  ),
                  Text(
                    'mirzawinanda07@gmail.com',
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 14,
                    ),
                  ),
                ],
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
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AbsenPage()),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.calendar_today),
              title: Text('Cuti'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CutiPage()),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.money),
              title: Text('Gaji'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => GajiPage()),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.calendar_month_outlined),
              title: Text('Kalender'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => KalenderPage()),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.newspaper),
              title: Text('Pengumuman'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => PengumumanPage()),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.logout),
              title: Text('Keluar'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LoginScreen()),
                );
              },
            ),
          ],
        ),
      ),
      body: ListView(
        children: [
          Container(
            padding: EdgeInsets.only(top: 15, left: 15, right: 15, bottom: 10),
            decoration: const BoxDecoration(
              color: Color(0xFF41B06E),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20),
              ),
            ),
            child: Column(
              children: [
                const SizedBox(height: 20),
                Padding(
                  padding: EdgeInsets.only(left: 3, bottom: 15),
                  child: Text(
                    "Selamat Datang $userName",
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 1,
                      wordSpacing: 2,
                      color: Colors.white,
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 5, bottom: 20),
                  width: MediaQuery.of(context).size.width,
                  height: 55,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: TextField(
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Cari Disini",
                      hintStyle: TextStyle(
                        color: Colors.black.withOpacity(0.5),
                      ),
                      prefixIcon: const Icon(
                        Icons.search,
                        size: 23,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20, left: 15, right: 15),
            child: Column(
              children: [
                GridView.builder(
                  itemCount: menu.length,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    childAspectRatio: 1.1,
                  ),
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        if (menu[index] == "Absen") {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => AbsenPage(),
                            ),
                          );
                        } else if (menu[index] == "Pengumuman") {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => PengumumanPage()),
                          );
                        } else if (menu[index] == "Kalender") {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => KalenderPage()),
                          );
                        } else if (menu[index] == "Cuti") {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => CutiPage()),
                          );
                        } else if (menu[index] == "Profile") {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ProfilePage()),
                          );
                        } else if (menu[index] == "Gaji") {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => GajiPage(),
                            ),
                          );
                        }
                      },
                      child: Column(
                        children: [
                          Container(
                            height: 60,
                            width: 60,
                            decoration: BoxDecoration(
                              color: warnaMenu[index],
                              shape: BoxShape.circle,
                            ),
                            child: Center(child: iconMenu[index]),
                          ),
                          const SizedBox(height: 10),
                          Text(menu[index]),
                        ],
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
