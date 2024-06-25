import 'package:flutter/material.dart';

class GajiPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Halaman Gaji'),
        backgroundColor: Color(0xFF41B06E),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            Card(
              child: ListTile(
                title: Text('Gaji Pokok'),
                subtitle: Text('Rp 5,000,000'),
              ),
            ),
            Card(
              child: ListTile(
                title: Text('Tunjangan Transportasi'),
                subtitle: Text('Rp 500,000'),
              ),
            ),
            Card(
              child: ListTile(
                title: Text('Tunjangan Makan'),
                subtitle: Text('Rp 1,000,000'),
              ),
            ),
            Card(
              child: ListTile(
                title: Text('Bonus Kinerja'),
                subtitle: Text('Rp 1,500,000'),
              ),
            ),
            Card(
              child: ListTile(
                title: Text('Total Gaji'),
                subtitle: Text('Rp 8,000,000'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
