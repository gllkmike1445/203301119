import 'package:chat_by_me/screens/home/editContact.dart';
import 'package:flutter/material.dart';

import '../../models/user.dart';

class ContactsPage extends StatefulWidget {
  @override
  State<ContactsPage> createState() => _ContactsPageState();
}

class _ContactsPageState extends State<ContactsPage> {
  List<User> contacts = [
    User(
        name: 'Ahmet',
        email: 'ahmet@example.com',
        password: '123456',
        phone: '1234567890'),
    User(
        name: 'Mehmet',
        email: 'mehmet@example.com',
        password: '123456',
        phone: '1234567890'),
    User(
        name: 'Ayşe',
        email: 'ayse@example.com',
        password: '123456',
        phone: '1234567890'),
    User(
        name: 'Fatma',
        email: 'fatma@example.com',
        password: '123456',
        phone: '1234567890'),
    User(
        name: 'Ali',
        email: 'ali@example.com',
        password: '123456',
        phone: '1234567890'),
    User(
        name: 'Veli',
        email: 'veli@example.com',
        password: '123456',
        phone: '1234567890'),
    User(
        name: 'Can',
        email: 'can@example.com',
        password: '123456',
        phone: '1234567890'),
    User(
        name: 'Emre',
        email: 'emre@example.com',
        password: '123456',
        phone: '1234567890'),
  ];

  void editContact(BuildContext context, User contact) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => EditContactPage(
          email: contact.email,
          name: contact.name,
          phone: contact.phone,
        ),
      ),
    );
  }

  void deleteContact(User contact) {
    setState(() {
      contacts.remove(contact);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: const Color(0xFFFFC600),
        title: const Text(
          'Kişiler',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: ListView.builder(
        itemCount: contacts.length,
        itemBuilder: (context, index) {
          return ListTile(
            onTap: () {},
            leading: CircleAvatar(
              backgroundImage: const NetworkImage("https://picsum.photos/id/1015/200"),
              child:
              Text(contacts[index].name[0]),
            ),
            title: Text(contacts[index].name),
            subtitle: const Text('Durum yok'),
            trailing: PopupMenuButton(
              onSelected: (result) {
                if (result == 'edit') {
                  editContact(context, contacts[index]);
                } else if (result == 'delete') {
                  deleteContact(contacts[index]);
                }
              },
              itemBuilder: (BuildContext context) => [
                const PopupMenuItem(
                  value: 'edit',
                  child: Text('Düzenle'),
                ),
                const PopupMenuItem(
                  value: 'delete',
                  child: Text('Sil'),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
