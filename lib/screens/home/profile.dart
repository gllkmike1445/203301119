import 'package:chat_by_me/auth.dart';
import 'package:chat_by_me/screens/authentication/login.dart';
import 'package:chat_by_me/screens/authentication/resetPassword.dart';
import 'package:chat_by_me/screens/home/privacy.dart';
import 'package:flutter/material.dart';
import 'package:chat_by_me/Globals.dart' as globals;

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    globals.fetchInfo();
    var image = Uri.parse(globals.user?.image).data == null
        ? NetworkImage(globals.user?.image) as ImageProvider
        : MemoryImage(Uri.parse(globals.user?.image).data!.contentAsBytes());
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: const Color(0xFFFFC600),
        title: const Text(
          'Profil',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              height: 200.0,
              color: Colors.grey[300],
              child: Center(
                child: CircleAvatar(radius: 50.0, backgroundImage: image),
              ),
            ),
            const SizedBox(height: 20.0),
            Text(
              globals.name,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10.0),
            Text(
              globals.email,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16.0,
                color: Colors.grey[700],
              ),
            ),
            const SizedBox(height: 20.0),
             ListTile(
              leading: Icon(Icons.phone),
              title: Text('Telefon Numarası'),
              subtitle: Text(globals.phone),
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
            const Divider(),
            ListTile(
              onTap: () {
                Auth().out().then((value) => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>  LoginPage())));

              },
              leading: const Icon(Icons.exit_to_app),
              title: const Text('Çıkış'),
            ),
          ],
        ),
      ),
    );
  }
}
