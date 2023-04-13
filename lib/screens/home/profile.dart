import 'package:chat_by_me/screens/authentication/resetPassword.dart';
import 'package:chat_by_me/screens/home/privacy.dart';
import 'package:flutter/material.dart';

import 'package:flutter/material.dart';

import '../../models/user.dart';

class ProfilePage extends StatelessWidget {
  final User? user;

  ProfilePage({this.user});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Color(0xFFFFC600),
        title: Text(
          'Profil',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            height: 200.0,
            color: Colors.grey[300],
            child: Center(
              child: CircleAvatar(
                radius: 50.0,
                backgroundImage: NetworkImage(
                    'https://www.w3schools.com/w3images/avatar2.png'),
              ),
            ),
          ),
          SizedBox(height: 20.0),
          Text(
            'Mikail Yusuf Güllük',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 24.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 10.0),
          Text(
            'mikail.gulluk@gmail.com',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 16.0,
              color: Colors.grey[700],
            ),
          ),
          SizedBox(height: 20.0),
          ListTile(
            leading: Icon(Icons.phone),
            title: Text('Telefon Numarası'),
            subtitle: Text('+90 555 555 55 55'),
          ),
          Divider(),
          ListTile(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => PrivacyPage()));
            },
            leading: Icon(Icons.lock),
            title: Text('Gizlilik'),
            subtitle: Text('Hesabım özel'),
          ),
          Divider(),
          ListTile(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ChangePasswordPage()));
            },
            leading: Icon(Icons.security),
            title: Text('Şifre'),
            subtitle: Text('••••••••'),
          ),
        ],
      ),
    );
  }
}
