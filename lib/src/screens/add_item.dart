import 'package:flutter/material.dart';

class AddItem extends StatefulWidget {
  AddItem();
  @override
  _AddItemState createState() => _AddItemState();
}

class _AddItemState extends State<AddItem> {
  DateTime _date;
  TextEditingController titleController;
  TextEditingController dateController;
  TextEditingController deskripsiController;
  @override
  void initState() {
    titleController = TextEditingController();
    dateController = TextEditingController();
    deskripsiController = TextEditingController();
    titleController.text = '';
    dateController.text = '';
    deskripsiController.text = '';
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(top: 25),
        color: Colors.white,
        child: Column(
          children: [
            Container(
              height: 50,
              padding: EdgeInsets.only(left: 10, right: 10),
              child: Stack(
                children: [
                  Align(
                    alignment: Alignment.center,
                    child: Text(
                      'Tambah kegiatan',
                      style: TextStyle(fontSize: 18, color: Colors.blueAccent),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: InkWell(
                      child: Padding(
                        padding: EdgeInsets.all(5),
                        child: Icon(Icons.arrow_back),
                      ),
                      onTap: () {
                        Navigator.pop(context);
                      },
                    ),
                  )
                ],
              ),
            ),
            Divider(
              height: 1,
              color: Colors.black,
            ),
            Expanded(
              child: ListView(
                padding: EdgeInsets.only(
                  top: 10,
                  left: 10,
                  right: 10,
                ),
                children: [
                  TextField(
                    controller: titleController,
                    textAlignVertical: TextAlignVertical.center,
                    textAlign: TextAlign.left,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Judul Kegiatan'),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextField(
                    controller: deskripsiController,
                    textAlignVertical: TextAlignVertical.center,
                    textAlign: TextAlign.left,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(), labelText: 'Deskripsi'),
                  ),
                  Divider(
                    color: Colors.black,
                  ),
                  TextButton(
                      child: Text(
                        'Pilih Tanggal',
                        style: TextStyle(fontSize: 12, color: Colors.black),
                      ),
                      onPressed: () {
                        showDatePicker(
                                context: context,
                                initialDate: DateTime.now(),
                                firstDate: DateTime(2001),
                                lastDate: DateTime(2240))
                            .then((date) {
                          _date = date;
                        }).toString();
                        print(_date);
                      }),
                  FlatButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text(
                      'Submit',
                      style: TextStyle(color: Colors.white, fontSize: 14),
                    ),
                    height: 45,
                    color: Colors.blueAccent,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
