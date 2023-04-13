import 'dart:math';

import 'package:chat_by_me/screens/authentication/login.dart';
import 'package:chat_by_me/screens/authentication/register.dart';
import 'package:chat_by_me/screens/home/navigation_bar.dart';
import 'package:chat_by_me/widgets/general/text/headerText.dart';
import 'package:chat_by_me/widgets/general/text/smallText.dart';
import 'package:flutter/material.dart';

import '../../models/user.dart';

void showErrorMessage(BuildContext context, String errorMessage) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(errorMessage),
      backgroundColor: Colors.red,
    ),
  );
}

class RegisterPage extends StatelessWidget {
  final mailController = TextEditingController();
  final nameController = TextEditingController();
  final phoneController = TextEditingController();
  final passwordController = TextEditingController();
  final passwordAgainController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 30.0),
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Logo
                HeaderText(text: 'Kayıt Ol'),
                SizedBox(height: 40.0),
                // Kullanıcı Adı Alanı
                TextFormField(
                  controller: nameController,
                  decoration: InputDecoration(
                    hintText: 'Ad Soyad',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                    filled: true,
                    fillColor: Colors.white,
                  ),
                ),
                SizedBox(height: 20.0),
                // Şifre Alanı
                TextFormField(
                  controller: mailController,
                  decoration: InputDecoration(
                    hintText: 'E-Posta',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                    filled: true,
                    fillColor: Colors.white,
                  ),
                ),
                SizedBox(height: 20.0),
                // Şifre Alanı
                TextFormField(
                  controller: phoneController,
                  decoration: InputDecoration(
                    hintText: 'Telefon Numarası',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                    filled: true,
                    fillColor: Colors.white,
                  ),
                ),
                SizedBox(height: 20.0),
                // Şifre Alanı
                TextFormField(
                  controller: passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    hintText: 'Şifre',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                    filled: true,
                    fillColor: Colors.white,
                  ),
                ),
                SizedBox(height: 20.0),
                // Şifre Alanı
                TextFormField(
                  controller: passwordAgainController,
                  obscureText: true,
                  decoration: InputDecoration(
                    hintText: 'Tekrar Şifre',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                    filled: true,
                    fillColor: Colors.white,
                  ),
                ),
                SizedBox(height: 30.0),
                Container(
                  margin: EdgeInsets.only(bottom: 20),
                  width: MediaQuery.of(context).size.width,
                  child: ElevatedButton(
                    onPressed: () {
                      User user = User(
                        phone: phoneController.text,
                        name: nameController.text,
                        email: mailController.text,
                        password: passwordController.text,
                      );
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => LoginPage(user: user),
                        ),
                      );
                    },
                    child: SmallText(
                      text: 'Kayıt Ol',
                      color: Colors.black,
                    ),
                    style: ElevatedButton.styleFrom(
                      primary: Color(0xFFFFC600),
                    ),
                  ),
                ),
                Row(
                  children: [
                    Expanded(
                      child: Divider(
                        color: Colors.black,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: Text(
                        'veya',
                        style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Divider(
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Hesabın var mı?',
                      style: TextStyle(
                        fontSize: 14,
                      ),
                    ),
                    SizedBox(width: 5),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => LoginPage(),
                          ),
                        );
                      },
                      child: Text(
                        'Giriş Yap',
                        style:
                            TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
