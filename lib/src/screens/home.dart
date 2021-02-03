import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:jadwal_app/src/model/entry.dart';
import 'package:jadwal_app/src/providers/entry_providers.dart';
import 'package:jadwal_app/src/screens/detail.dart';
import 'package:jadwal_app/src/screens/entry.dart';
import 'package:jadwal_app/src/screens/profile.dart';
import 'package:jadwal_app/src/screens/profile.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final entryProvider = Provider.of<EntryProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Jadwalku'),
        actions: [
          IconButton(
              icon: Icon(
                Icons.person,
                color: Colors.black,
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => profileu()),
                );
              })
        ],
      ),
      body: StreamBuilder<List<Entry>>(
          stream: entryProvider.entries,
          builder: (context, snapshot) {
            return ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (context, index) {
                  return Card(
                    margin: EdgeInsets.symmetric(vertical: 7, horizontal: 7),
                    elevation: 4,
                    child: ListTile(
                      hoverColor: Colors.blueAccent,
                      trailing: IconButton(
                        icon: Icon(Icons.edit),
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) =>
                                  EntryScreen(entry: snapshot.data[index])));
                        },
                      ),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (ctx) =>
                                    Detail(entry: snapshot.data[index])));
                      },
                      title: Text(snapshot.data[index].entry),
                      subtitle: Text(
                        formatDate(DateTime.parse(snapshot.data[index].date),
                            [MM, ' ', d, ', ', yyyy]),
                      ),
                    ),
                  );
                });
          }),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => EntryScreen()));
        },
      ),
    );
  }
}
