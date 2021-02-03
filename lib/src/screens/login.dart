import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jadwal_app/src/screens/home.dart';
import 'package:jadwal_app/src/screens/verify.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({Key key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String _email, _password;
  final auth = FirebaseAuth.instance;
  User user;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
              width: 100,
              height: 100,
              margin: EdgeInsets.only(bottom: 8),
              child: Image.asset('assets/calendar.png')),
          Padding(
            padding: const EdgeInsets.only(
              bottom: 15,
            ),
            child: Text(
              'JADWALKU',
              style: TextStyle(
                  fontFamily: 'monserrat',
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                  border: OutlineInputBorder(), labelText: 'Email'),
              onChanged: (value) {
                setState(() {
                  _email = value.trim();
                });
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              obscureText: true,
              decoration: InputDecoration(
                  border: OutlineInputBorder(), labelText: 'Password'),
              onChanged: (value) {
                setState(() {
                  _password = value.trim();
                });
              },
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: double.infinity,
                height: 50,
                margin: EdgeInsets.all(10),
                child: OutlineButton(
                  borderSide: BorderSide(
                      color: Colors.blueAccent, style: BorderStyle.solid),
                  textColor: Colors.white,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50)),
                  color: Theme.of(context).accentColor,
                  child: Text(
                    'Masuk',
                    style: TextStyle(
                        color: Colors.blueAccent,
                        fontWeight: FontWeight.bold,
                        fontSize: 16),
                  ),
                  onPressed: () {
                    if (_password.length < 6) {
                      showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return CupertinoAlertDialog(
                              title:
                                  Icon(Icons.warning, color: Colors.redAccent),
                              content: Text('Email atau Password anda salah'),
                              actions: <Widget>[
                                CupertinoDialogAction(
                                  child: Text('Tutup'),
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                )
                              ],
                            );
                          });
                    } else {
                      auth
                          .signInWithEmailAndPassword(
                              email: _email, password: _password)
                          .then((_) {
                        Navigator.of(context).pushReplacement(MaterialPageRoute(
                          builder: (context) => HomeScreen(),
                        ));
                      });
                    }
                  },
                ),
              ),
              Text('Atau'),
              Container(
                margin: EdgeInsets.all(10),
                width: double.infinity,
                height: 50,
                child: RaisedButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                  color: Theme.of(context).accentColor,
                  child: Text(
                    'Daftar',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 16),
                  ),
                  onPressed: () {
                    if (_password.length < 6 || _password == null) {
                      showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return CupertinoAlertDialog(
                              title: Icon(
                                Icons.warning,
                                color: Colors.redAccent,
                              ),
                              content:
                                  Text('Password harus lebih dari 6 karakter'),
                              actions: <Widget>[
                                CupertinoDialogAction(
                                  child: Text('Tutup'),
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                )
                              ],
                            );
                          });
                    } else {
                      auth
                          .createUserWithEmailAndPassword(
                              email: _email, password: _password)
                          .then((_) {
                        Navigator.of(context).pushReplacement(MaterialPageRoute(
                          builder: (context) => VerifyScreen(),
                        ));
                      });
                    }
                  },
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
