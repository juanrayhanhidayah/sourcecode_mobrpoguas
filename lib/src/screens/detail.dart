import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:jadwal_app/src/model/entry.dart';
import 'package:jadwal_app/src/providers/entry_providers.dart';
import 'package:provider/provider.dart';

class Detail extends StatefulWidget {
  final Entry entry;
  final Entry desc;

  Detail({this.entry, this.desc});

  @override
  _DetailState createState() => _DetailState();
}

class _DetailState extends State<Detail> {
  final entryController = TextEditingController();
  final descController = TextEditingController();

  @override
  void dispose() {
    entryController.dispose();
    descController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    final entryProvider = Provider.of<EntryProvider>(context, listen: false);
    if (widget.entry != null) {
      //Edit
      entryController.text = widget.entry.entry;
      descController.text = widget.entry.desc;
      entryProvider.loadAll(widget.entry);
    } else {
      //Add
      entryProvider.loadAll(null);
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final entryProvider = Provider.of<EntryProvider>(context);
    return Scaffold(
        backgroundColor: Colors.blue,
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: Icon(Icons.arrow_back_ios),
            color: Colors.white,
          ),
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          title: Text('Details',
              style: TextStyle(
                  fontFamily: 'Montserrat',
                  fontSize: 18.0,
                  color: Colors.white)),
          centerTitle: true,
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.more_horiz),
              onPressed: () {},
              color: Colors.white,
            )
          ],
        ),
        body: ListView(children: [
          Stack(children: [
            Container(
                height: MediaQuery.of(context).size.height - 82.0,
                width: MediaQuery.of(context).size.width,
                color: Colors.transparent),
            Positioned(
                top: 75.0,
                child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(45.0),
                          topRight: Radius.circular(45.0),
                        ),
                        color: Colors.white),
                    height: MediaQuery.of(context).size.height - 100.0,
                    width: MediaQuery.of(context).size.width)),
            Positioned(
                top: 30.0,
                left: (MediaQuery.of(context).size.width / 2) - 100.0,
                child: Center(
                    child: Container(
                        /*decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage('asset/image/1.png'),
                                fit: BoxFit.cover)
                                ),*/
                        height: 200.0,
                        width: 200.0))),
            Positioned(
                top: 250.0,
                left: 25.0,
                right: 25.0,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(widget.entry.entry,
                        style: TextStyle(
                            fontFamily: 'Montserrat',
                            fontSize: 22.0,
                            fontWeight: FontWeight.bold)),
                    SizedBox(height: 20.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(widget.entry.desc,
                            style: TextStyle(
                                fontFamily: 'Montserrat',
                                fontSize: 20.0,
                                color: Colors.grey)),
                        Container(height: 25.0, color: Colors.grey, width: 1.0),
                      ],
                    ),
                    SizedBox(height: 140.0),
                    Padding(
                        padding: const EdgeInsets.only(left: 200, bottom: 10),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Container(
                                width: 100,
                                height: 35,
                                child: Center(
                                  child: Text(
                                    formatDate(entryProvider.date,
                                        [MM, ' ', d, ', ', yyyy]),
                                    style: TextStyle(color: Colors.black),
                                  ),
                                ),
                              )
                            ])),
                    Padding(
                      padding: EdgeInsets.only(bottom: 5.0),
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(25.0),
                                topRight: Radius.circular(25.0),
                                bottomLeft: Radius.circular(25.0),
                                bottomRight: Radius.circular(25.0)),
                            color: Colors.redAccent),
                        height: 50.0,
                        child: Center(
                          child: RaisedButton(
                            color: Colors.redAccent,
                            child: Text('Hapus',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: 'Montserrat',
                                    fontSize: 20)),
                            onPressed: () {
                              entryProvider.removeEntry(widget.entry.entryId);
                              Navigator.of(context).pop();
                            },
                          ),
                        ),
                      ),
                    )
                  ],
                ))
          ])
        ])

        /*appBar: AppBar(
        title: Center(child: Text(widget.entry.entry)),
      ),
      body: Center(
          child: Container(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: <Widget>[
            Text(widget.entry.desc),
            Text(formatDate(entryProvider.date, [MM, ' ', d, ', ', yyyy])),
          ],
        ),
      )),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.delete),
        onPressed: () {
          entryProvider.removeEntry(widget.entry.entryId);
          Navigator.of(context).pop();
        },
      ),
    );*/
        );
  }

  Future<DateTime> _pickDate(
      BuildContext context, EntryProvider entryProvider) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: entryProvider.date,
        firstDate: DateTime(2019),
        lastDate: DateTime(2050));

    if (picked != null) return picked;
  }
}
