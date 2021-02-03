import 'package:flutter/material.dart';
import 'package:jadwal_app/src/screens/editprofile.dart';

class profileu extends StatefulWidget {
  @override
  _profileuState createState() => _profileuState();
}

class _profileuState extends State<profileu> {
  String name;
  String email;
  String image;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
        title: Text('Profile'),
        actions: [
          IconButton(
              icon: Icon(
                Icons.settings,
                color: Colors.black,
              ),
              onPressed: () {
                _editProfile(context);
              })
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            CircleAvatar(
              radius: 75,
              child: image != null
                  ? Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          fit: BoxFit.fill,
                          image: NetworkImage(
                            image,
                          ),
                        ),
                      ),
                    )
                  : Icon(
                      Icons.person,
                      size: 80,
                      color: Colors.grey,
                    ),
            ),
            Container(
              height: 50,
              child: Text(
                name ?? 'Your Name',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Container(
              height: 50,
              child: Text(
                email ?? 'Your Email',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  _editProfile(BuildContext context) async {
    var callback = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => editprofileu()),
    );
    print(callback);
    if (callback == null) {
      return;
    }
    setState(() {
      name = callback['name'];
      email = callback['email'];
      image = callback['image'];
    });
  }
}
