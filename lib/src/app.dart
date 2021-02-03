import 'package:flutter/material.dart';
import 'package:jadwal_app/src/providers/entry_providers.dart';
import 'package:jadwal_app/src/screens/login.dart';
import 'package:provider/provider.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => EntryProvider(),
      child: MaterialApp(
          home: LoginScreen(),
          theme: ThemeData(
            accentColor: Colors.blueAccent,
            primaryColor: Colors.blue,
          )),
    );
  }
}
