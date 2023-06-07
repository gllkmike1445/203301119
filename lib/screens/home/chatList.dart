import 'package:flutter/material.dart';
import 'package:flutter/material.dart';

import 'chat.dart';

class ChatListPage extends StatefulWidget {
  @override
  _ChatListPageState createState() => _ChatListPageState();
}

class _ChatListPageState extends State<ChatListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        automaticallyImplyLeading: false,
        backgroundColor: const Color(0xFFFFC600),
        title: const Text(
          'Sohbetlerim',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: ListView.builder(
        itemCount: 3,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            leading: const CircleAvatar(
              backgroundColor: Color(0xFFFFC600),
              child: Text('M'),
            ),
            title: const Text('John Doe'),
            subtitle: const Text('....'),
            trailing: const Text('9:20'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => WhatsAppChatPage(),
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xFFFFC600),
        onPressed: () {},
        child: const Icon(
          Icons.add,
          color: Colors.black,
        ),
      ),
    );
  }
}
