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
        backgroundColor: const Color(0xFFFFC600),
        title: const Text(
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
            child: const Center(
              child: CircleAvatar(
                radius: 50.0,
                backgroundImage: NetworkImage(
                    'https://www.w3schools.com/w3images/avatar2.png'),
              ),
            ),
          ),
          const SizedBox(height: 20.0),
          const Text(
            'Mikail Yusuf Güllük',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 24.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 10.0),
          Text(
            'mikail.gulluk@gmail.com',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 16.0,
              color: Colors.grey[700],
            ),
          ),
          const SizedBox(height: 20.0),
          const ListTile(
            leading: Icon(Icons.phone),
            title: Text('Telefon Numarası'),
            subtitle: Text('+90 555 555 55 55'),
          ),
          const Divider(),
          ListTile(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => PrivacyPage()));
            },
            leading: const Icon(Icons.lock),
            title: const Text('Gizlilik'),
            subtitle: const Text('Hesabım özel'),
          ),
          const Divider(),
          ListTile(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const ChangePasswordPage()));
            },
            leading: const Icon(Icons.security),
            title: const Text('Şifre'),
            subtitle: const Text('••••••••'),
          ),
        ],
      ),
    );
  }
}
