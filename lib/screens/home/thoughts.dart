import 'package:flutter/material.dart';

class ThoughtsPage extends StatelessWidget {
  ThoughtsPage({super.key});

  final List<Thought> thoughts = [
    Thought(
      name: 'Ahmet',
      imageUrl: 'https://picsum.photos/id/1018/200',
      time: '1 saat önce',
      thought: 'Bugün hava çok güzel!',
    ),
    Thought(
      name: 'Mehmet',
      imageUrl: 'https://picsum.photos/id/1015/200',
      time: '2 saat önce',
      thought: 'Benim için en iyi yemek makarna!',
    ),
    Thought(
      name: 'Ayşe',
      imageUrl: 'https://picsum.photos/id/1016/200',
      time: '3 saat önce',
      thought: 'Hayatımda gördüğüm en güzel manzara burası!',
    ),
    Thought(
      name: 'Fatma',
      imageUrl: 'https://picsum.photos/id/1024/200',
      time: '4 saat önce',
      thought: 'Bugün çok yorgunum :(',
    ),
    Thought(
      name: 'Ali',
      imageUrl: 'https://picsum.photos/id/1021/200',
      time: '5 saat önce',
      thought: 'Bu sınav gerçekten çok zordu!',
    ),
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Color(0xFFFFC600),
        title: const Text(
          'Durumlar',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: ListView.builder(
        itemCount: thoughts.length,
        itemBuilder: (context, index) {
          return Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
            child: Card(
              elevation: 2.0,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        CircleAvatar(
                          radius: 20,
                          backgroundImage:
                              NetworkImage(thoughts[index].imageUrl),
                        ),
                        const SizedBox(width: 8.0),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              thoughts[index].name,
                              style: const TextStyle(
                                  fontSize: 16.0, fontWeight: FontWeight.bold),
                            ),
                            Text(
                              thoughts[index].time,
                              style:
                                  TextStyle(fontSize: 12.0, color: Colors.grey),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 8.0),
                    Text(
                      thoughts[index].thought,
                      style: const TextStyle(fontSize: 16.0),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xFFFFC600),
        child: const Icon(Icons.add),
        onPressed: () {
          showModalBottomSheet(
            context: context,
            builder: (context) => NewThoughtModal(),
          );

        },
      ),
    );
  }
}

class Thought {
  final String name;
  final String imageUrl;
  final String time;
  final String thought;

  Thought({
    required this.name,
    required this.imageUrl,
    required this.time,
    required this.thought,
  });
}

class NewThoughtModal extends StatefulWidget {
  @override
  _NewThoughtModalState createState() => _NewThoughtModalState();
}

class _NewThoughtModalState extends State<NewThoughtModal> {
  String _name = '';
  String _imageUrl = '';
  String _thought = '';

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text('Yeni Düşünce Ekle'),
          SizedBox(height: 16.0),
          TextFormField(
            decoration: InputDecoration(
              labelText: 'Adınız',
            ),
            onChanged: (value) {
              setState(() {
                _name = value;
              });
            },
          ),
          SizedBox(height: 16.0),
          TextFormField(
            decoration: InputDecoration(
              labelText: 'Profil Resmi URL\'si',
            ),
            onChanged: (value) {
              setState(() {
                _imageUrl = value;
              });
            },
          ),
          SizedBox(height: 16.0),
          TextFormField(
            decoration: InputDecoration(
              labelText: 'Düşünceniz',
            ),
            onChanged: (value) {
              setState(() {
                _thought = value;
              });
            },
          ),
          SizedBox(height: 16.0),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: Color(0xFFFFC600),
            ),
            child: Text('Ekle'),
            onPressed: () {
              // Yeni düşünceyi ekleyin
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
