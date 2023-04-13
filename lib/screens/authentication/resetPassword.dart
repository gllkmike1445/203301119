import 'package:flutter/material.dart';

class ChangePasswordPage extends StatefulWidget {
  @override
  _ChangePasswordPageState createState() => _ChangePasswordPageState();
}

class _ChangePasswordPageState extends State<ChangePasswordPage> {
  TextEditingController _currentPasswordController = TextEditingController();
  TextEditingController _newPasswordController = TextEditingController();
  TextEditingController _confirmNewPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFFFC600),
        title: Text('Şifremi Değiştir'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextFormField(
              controller: _currentPasswordController,
              decoration: InputDecoration(
                labelText: 'Mevcut Şifre',
              ),
              obscureText: true,
            ),
            SizedBox(height: 16.0),
            TextFormField(
              controller: _newPasswordController,
              decoration: InputDecoration(
                labelText: 'Yeni Şifre',
              ),
              obscureText: true,
            ),
            SizedBox(height: 16.0),
            TextFormField(
              controller: _confirmNewPasswordController,
              decoration: InputDecoration(
                labelText: 'Yeni Şifre Tekrar',
              ),
              obscureText: true,
            ),
            SizedBox(height: 32.0),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Color(0xFFFFC600),
              ),
              onPressed: () {},
              child: Text('Değiştir'),
            ),
          ],
        ),
      ),
    );
  }
}
