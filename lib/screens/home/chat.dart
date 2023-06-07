import 'package:chat_by_me/screens/home/editContact.dart';
import 'package:flutter/material.dart';
import 'package:chat_by_me/Globals.dart' as globals;

class WhatsAppChatPage extends StatefulWidget {
  @override
  _WhatsAppChatPageState createState() => _WhatsAppChatPageState();
}

class _WhatsAppChatPageState extends State<WhatsAppChatPage> {
  List<WhatsAppMessage> messages = [
    WhatsAppMessage(
        message: "Merhaba, nasılsın?",
        senderName: "Ahmet",
        profileImage: "ahmet.jpg"),
    WhatsAppMessage(
        message: "İyiyim, sen nasılsın?",
        senderName: "Ayşe",
        profileImage: "ayse.jpg"),
    WhatsAppMessage(
        message: "Ben de iyiyim, teşekkür ederim.",
        senderName: "Ahmet",
        profileImage: "ahmet.jpg"),
    WhatsAppMessage(
        message: "Ne yapıyorsun bu aralar?",
        senderName: "Ayşe",
        profileImage: "ayse.jpg"),
    WhatsAppMessage(
        message: "İşler biraz yoğun ama iyi gidiyor.",
        senderName: "Ahmet",
        profileImage: "ahmet.jpg"),
    WhatsAppMessage(
        message: "Anladım, kolay gelsin.",
        senderName: "Ayşe",
        profileImage: "ayse.jpg"),
  ];

  final _textController = TextEditingController();
  bool _isComposing = false;

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFFFC600),
        title:  Text(
          globals.user.name,
          style: TextStyle(color: Colors.black),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.more_vert),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => EditContactPage(name: globals.user.name, phone: globals.user.phone, email: globals.user.email),
                ),
              );
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(8.0),
              reverse: true,
              itemCount: messages.length,
              itemBuilder: (BuildContext context, int index) {
                final message = messages[index];
                return _buildMessage(message);
              },
            ),
          ),
          const Divider(height: 1.0),
          Container(
            decoration: BoxDecoration(color: Theme.of(context).cardColor),
            child: _buildTextComposer(),
          ),
        ],
      ),
    );
  }

  Widget _buildMessage(WhatsAppMessage message) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.only(right: 16.0),
            child: const CircleAvatar(
              backgroundColor: Color(0xFFFFC600),
              child: Text('M'),
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(message.senderName,
                    style:
                        const TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold)),
                Container(
                  margin: const EdgeInsets.only(top: 5.0),
                  child: Text(message.message),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTextComposer() {
    return IconTheme(
      data: IconThemeData(color: Colors.amber),
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 8.0),
        child: Row(
          children: [
            Flexible(
              child: TextFormField(
                controller: _textController,
                onChanged: (text) {
                  setState(() {
                    _isComposing = text.length > 0;
                  });
                },
                onFieldSubmitted: _handleSubmitted,
                decoration:
                    InputDecoration.collapsed(hintText: "Bir mesaj yazın"),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 4.0),
              child: IconButton(
                icon: Icon(Icons.send),
                onPressed: _isComposing
                    ? () => _handleSubmitted(_textController.text)
                    : null,
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _handleSubmitted(String text) {
    _textController.clear();
    setState(() {
      _isComposing = false;
      messages.insert(
          0,
          WhatsAppMessage(
              message: text, senderName: "Siz", profileImage: "siz.jpg"));
    });
  }
}

class WhatsAppMessage {
  final String message;
  final String senderName;
  final String profileImage;

  WhatsAppMessage(
      {required this.message,
      required this.senderName,
      required this.profileImage});
}
