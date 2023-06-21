import 'package:chat_by_me/screens/authentication/login.dart';
import 'package:chat_by_me/screens/authentication/resetPassword.dart';
import 'package:chat_by_me/screens/home/admin_settings_screen.dart';
import 'package:chat_by_me/screens/home/changeBackground.dart';
import 'package:chat_by_me/screens/home/help_screen.dart';
import 'package:chat_by_me/screens/home/terms_screen.dart';
import 'package:chat_by_me/services/auth.dart';
import 'package:chat_by_me/services/globals.dart' as globals;
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  bool shouldShowAdmin() {
    return FirebaseAuth.instance.currentUser?.email == 'gullukmikail@gmail.com';
  }

  @override
  Widget build(BuildContext context) {
    globals.fetchInfo();
    var image = Uri.parse(globals.user?.image).data == null
        ? NetworkImage(globals.user?.image) as ImageProvider
        : MemoryImage(Uri.parse(globals.user?.image).data!.contentAsBytes());
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
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
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: image,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: 20.0),
            Text(
              globals.name,
              textAlign: TextAlign.center,
              style: const TextStyle(
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
            const Divider(),
            ListTile(
              leading: const Icon(Icons.phone),
              title: const Text('Telefon Numarası'),
              subtitle: Text(globals.phone),
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
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const HelpAndSupportScreen(),
                  ),
                );
              },
              leading: const Icon(Icons.help),
              title: const Text('İstek ve Öneri'),
              subtitle: const Text('Yardım'),
            ),
            if (shouldShowAdmin())
              Column(
                children: [
                  const Divider(),
                  ListTile(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const AdminSettingsScreen(),
                        ),
                      );
                    },
                    leading: const Icon(Icons.admin_panel_settings),
                    title: const Text('Admin'),
                  ),
                ],
              ),
            const Divider(),
            ListTile(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => PhotoListPage()));
              },
              leading: const Icon(Icons.settings),
              title: const Text('Arka Plan Ayarlari'),
              subtitle: const Text("Random Resimler"),
            ),
            const Divider(),
            ListTile(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => TermsAndConditionsScreen()));
              },
              leading: const Icon(Icons.security_sharp),
              title: const Text('Şartlar ve Koşullar'),
            ),
            const Divider(),
            ListTile(
              onTap: () async {
                await Auth().signOut();
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => LoginPage()));
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
