import 'package:flutter/material.dart';
import 'cuti_model.dart';

class CutiPage extends StatefulWidget {
  @override
  _CutiPageState createState() => _CutiPageState();
}

class _CutiPageState extends State<CutiPage> {
  List<Cuti> cutiList = [];

  @override
  void initState() {
    super.initState();
    // Initialize with some sample data
    cutiList.add(Cuti(
      id: 1,
      alasan: 'Liburan',
      tanggalMulai: DateTime.now(),
      tanggalSelesai: DateTime.now().add(Duration(days: 5)),
    ));
  }

  void _addCuti(Cuti cuti) {
    setState(() {
      cutiList.add(cuti);
    });
  }

  void _showAddCutiDialog() {
    final _alasanController = TextEditingController();
    DateTime? _tanggalMulai;
    DateTime? _tanggalSelesai;

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Tambah Cuti'),
          content: SingleChildScrollView(
            child: Column(
              children: [
                TextField(
                  controller: _alasanController,
                  decoration: InputDecoration(labelText: 'Alasan'),
                ),
                SizedBox(height: 10),
                TextButton(
                  onPressed: () async {
                    final picked = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(2000),
                      lastDate: DateTime(2101),
                    );
                    if (picked != null) {
                      setState(() {
                        _tanggalMulai = picked;
                      });
                    }
                  },
                  child: Text(_tanggalMulai == null
                      ? 'Pilih Tanggal Mulai'
                      : _tanggalMulai!.toLocal().toString().split(' ')[0]),
                ),
                SizedBox(height: 10),
                TextButton(
                  onPressed: () async {
                    final picked = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(2000),
                      lastDate: DateTime(2101),
                    );
                    if (picked != null) {
                      setState(() {
                        _tanggalSelesai = picked;
                      });
                    }
                  },
                  child: Text(_tanggalSelesai == null
                      ? 'Pilih Tanggal Selesai'
                      : _tanggalSelesai!.toLocal().toString().split(' ')[0]),
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Batal'),
            ),
            TextButton(
              onPressed: () {
                if (_alasanController.text.isNotEmpty &&
                    _tanggalMulai != null &&
                    _tanggalSelesai != null) {
                  _addCuti(Cuti(
                    id: cutiList.length + 1,
                    alasan: _alasanController.text,
                    tanggalMulai: _tanggalMulai!,
                    tanggalSelesai: _tanggalSelesai!,
                  ));
                  Navigator.of(context).pop();
                }
              },
              child: Text('Simpan'),
            ),
          ],
        );
      },
    );
  }

  void _updateCuti(int id, Cuti updatedCuti) {
    setState(() {
      int index = cutiList.indexWhere((cuti) => cuti.id == id);
      if (index != -1) {
        cutiList[index] = updatedCuti;
      }
    });
  }

  void _deleteCuti(int id) {
    setState(() {
      cutiList.removeWhere((cuti) => cuti.id == id);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Manage Cuti'),
        backgroundColor: Color(0xFF6DC5D1),
      ),
      body: ListView.builder(
        itemCount: cutiList.length,
        itemBuilder: (context, index) {
          final cuti = cutiList[index];
          return ListTile(
            title: Text(cuti.alasan),
            subtitle: Text(
              '${cuti.tanggalMulai.toLocal()} - ${cuti.tanggalSelesai.toLocal()}',
            ),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  icon: Icon(Icons.edit),
                  onPressed: () {
                    // Navigate to update page
                  },
                ),
                IconButton(
                  icon: Icon(Icons.delete),
                  onPressed: () {
                    _deleteCuti(cuti.id);
                  },
                ),
              ],
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _showAddCutiDialog,
        child: Icon(Icons.add),
        backgroundColor: Color(0xFF41B06E),
      ),
    );
  }
}
