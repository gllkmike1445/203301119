import 'dart:math';

import 'package:chat_by_me/screens/authentication/register.dart';
import 'package:chat_by_me/screens/home/navigation_bar.dart';
import 'package:chat_by_me/widgets/general/text/headerText.dart';
import 'package:chat_by_me/widgets/general/text/mediumText.dart';
import 'package:chat_by_me/widgets/general/text/smallText.dart';
import 'package:flutter/material.dart';

import '../../models/user.dart';
import '../../widgets/general/text/largeText.dart';

void showErrorMessage(BuildContext context, String errorMessage) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(errorMessage),
      backgroundColor: Colors.red,
    ),
  );
}

class LoginPage extends StatelessWidget {
  final mailController = TextEditingController();
  final passwordController = TextEditingController();
  final User? user;

  LoginPage({this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 30.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Logo
              HeaderText(text: 'Chat By Me'),
              LargeText(text: 'Hoşgeldin!'),
              SizedBox(height: 40.0),
              // Kullanıcı Adı Alanı
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
              SizedBox(height: 30.0),
              Container(
                margin: EdgeInsets.only(bottom: 20),
                width: MediaQuery.of(context).size.width,
                child: ElevatedButton(
                  onPressed: () {
                    if (mailController.text == user?.email &&
                        passwordController.text == user?.password) {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              HomePageNavigationBar(user: user),
                        ),
                      );
                    } else {
                      showErrorMessage(
                          context, 'Hatalı kullanıcı adı veya şifre');
                    }
                  },
                  child: SmallText(
                    text: 'Giriş Yap',
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
              SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 48,
                    width: 75,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10),
                          topRight: Radius.circular(10),
                          bottomLeft: Radius.circular(10),
                          bottomRight: Radius.circular(10)),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          blurRadius: 7,
                          offset: Offset(0, 3), // changes position of shadow
                        ),
                      ],
                    ),
                    child: Icon(Icons.facebook),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Container(
                    height: 48,
                    width: 75,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10),
                          topRight: Radius.circular(10),
                          bottomLeft: Radius.circular(10),
                          bottomRight: Radius.circular(10)),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          blurRadius: 7,
                          offset: Offset(0, 3), // changes position of shadow
                        ),
                      ],
                    ),
                    child: Icon(Icons.apple),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Container(
                    height: 48,
                    width: 75,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10),
                          topRight: Radius.circular(10),
                          bottomLeft: Radius.circular(10),
                          bottomRight: Radius.circular(10)),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          blurRadius: 7,
                          offset: Offset(0, 3), // changes position of shadow
                        ),
                      ],
                    ),
                    child: Icon(Icons.android),
                  ),
                ],
              ),
              SizedBox(height: 50),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Hesabın yok mu?',
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
                          builder: (context) => RegisterPage(),
                        ),
                      );
                    },
                    child: Text(
                      'Kayıt Ol...',
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                    ),
                  )
                ],
              )
              // Giriş ve Kayıt Ol Butonları
            ],
          ),
        ),
      ),
    );
  }
}
