import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class PhotoListPage extends StatefulWidget {
  @override
  _PhotoListPageState createState() => _PhotoListPageState();
}

class _PhotoListPageState extends State<PhotoListPage> {
  List<String> photoUrls = [];
  String selectedPhotoUrl = '';

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  void initState() {
    super.initState();
    fetchPhotos();
  }

  Future<void> fetchPhotos() async {
    final response = await http.get(
      Uri.parse('https://api.pexels.com/v1/curated?per_page=30&page=1'),
      headers: {
        'Authorization': 'Ul8c2VQHeqcWx4yvBBfQAdB5EFdsJw6xrxj2iPf3lVTawpCXy3Bw2sjm',
      },
    );

    if (response.statusCode == 200) {
      final jsonResponse = json.decode(response.body);
      final List<dynamic> photos = jsonResponse['photos'];
      final List<String> urls = photos
          .map<String>((photo) => photo['src']['medium'].toString())
          .toList();
      setState(() {
        photoUrls = urls;
      });
    } else {
      throw Exception('Failed to load photos');
    }
  }

  Future<void> updateUserBackgroundImage(String url) async {
    final User? currentUser = _auth.currentUser;
    if (currentUser != null) {
      final String uid = currentUser.uid;
      await _firestore
          .collection('users')
          .doc(uid)
          .update({'backgroundImage': url});
    }
  }

  void selectPhoto(String url) {
    setState(() {
      if (selectedPhotoUrl == url) {
        // Deselect the currently selected photo
        selectedPhotoUrl = '';
      } else {
        // Select a new photo
        selectedPhotoUrl = url;
      }
    });
  }

  @override

  Widget build(BuildContext context) {
    const snackBar = SnackBar(
      content: Text('Arka plan degistirildi.'),
    );
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: const Color(0xFFFFC600),
        title: const Text('Photo List'),
      ),
      body: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          childAspectRatio: 1.0,
        ),
        itemCount: photoUrls.length,
        itemBuilder: (context, index) {
          final url = photoUrls[index];
          final isSelected = url == selectedPhotoUrl;
          return GestureDetector(
            onTap: () {
              selectPhoto(url);
            },
            child: Stack(
              children: [
                Image.network(
                  url,
                  fit: BoxFit.cover,
                ),
                if (isSelected)
                  const Positioned(
                    top: 8,
                    right: 8,
                    child: Icon(
                      Icons.check_circle,
                      color: Colors.green,
                    ),
                  ),
              ],
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () async {
          if (selectedPhotoUrl.isNotEmpty) {
            await updateUserBackgroundImage(selectedPhotoUrl);
          }
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        },
        icon: const Icon(Icons.check),
        label: Text(selectedPhotoUrl.isNotEmpty ? 'Change' : 'Select'),
        backgroundColor: selectedPhotoUrl.isNotEmpty ? Colors.blue : Colors.green,
      ),
    );
  }
}
