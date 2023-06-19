import 'package:chat_by_me/screens/home/admin_screen.dart';
import 'package:chat_by_me/screens/home/geschlecht.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'help_screen.dart';

class AdminSettingsScreen extends StatelessWidget {
  const AdminSettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return
      SafeArea(
          child: Scaffold(
            appBar: AppBar(
              centerTitle: true,
              backgroundColor: const Color(0xFFFFC600),
              title: const Text(
                'Admin',
                style: TextStyle(color: Colors.black),
              ),
            ),
            body: Column(
              children: [
                ListTile(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const AdminInformation()));
                  },
                  leading: const Icon(Icons.perm_device_information),
                  title: const Text('Uygulama Verileri'),
                ),
                const Divider(),
                ListTile(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => AdminScreen(),
                      ),
                    );
                  },
                  leading: const Icon(Icons.help),
                  title: const Text('İstek ve Öneri'),
                  subtitle: const Text('Yardım'),
                ),
              ],
            ),
          )
      );
  }
}
