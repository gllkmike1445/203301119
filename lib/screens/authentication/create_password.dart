import 'package:chat_by_me/auth.dart';
import 'package:chat_by_me/screens/authentication/register.dart';
import 'package:chat_by_me/screens/home/navigation_bar.dart';
import 'package:chat_by_me/widgets/general/text/headerText.dart';
import 'package:chat_by_me/widgets/general/text/smallText.dart';
import 'package:flutter/material.dart';

import '../../models/user.dart';
import '../../widgets/general/text/largeText.dart';
import 'login.dart';

void showErrorMessage(BuildContext context, String errorMessage) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(errorMessage),
      backgroundColor: Colors.red,
    ),
  );
}

class CreatePassword extends StatelessWidget {
  final codeController = TextEditingController();
  final passwordController = TextEditingController();
  final passwordAgainController = TextEditingController();
  CreatePassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Logo
              const HeaderText(text: 'Chat By Me'),
              const LargeText(text: 'Hoşgeldin!'),
              const SizedBox(height: 40.0),
              // Kullanıcı Adı Alanı
              TextFormField(
                controller: codeController,
                decoration: InputDecoration(
                  hintText: 'Dogrulama kodu',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                    borderSide: const BorderSide(color: Colors.grey),
                  ),
                  filled: true,
                  fillColor: Colors.white,
                ),
              ),
              const SizedBox(height: 20.0),TextFormField(
                controller: passwordController,
                decoration: InputDecoration(
                  hintText: 'Yeni Şifre',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                    borderSide: const BorderSide(color: Colors.grey),
                  ),
                  filled: true,
                  fillColor: Colors.white,
                ),
              ),
              const SizedBox(height: 20.0), TextFormField(
                controller: passwordAgainController,
                decoration: InputDecoration(
                  hintText: 'Yeni Şifre Tekrar',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                    borderSide: const BorderSide(color: Colors.grey),
                  ),
                  filled: true,
                  fillColor: Colors.white,
                ),
              ),
              const SizedBox(height: 20.0),
              // Şifre Alanı
              Container(
                margin: const EdgeInsets.only(bottom: 20),
                width: MediaQuery
                    .of(context)
                    .size
                    .width,
                child: ElevatedButton(
                  onPressed: () {
                    if(codeController.text=='') {
                      showErrorMessage(context, 'kodu giriniz');
                      return;
                    }
                    if(codeController.text!='123456') {
                      showErrorMessage(context, 'hatali kod');
                      return;
                    }
                    if(passwordAgainController.text==''&&passwordController.text=='') {
                      showErrorMessage(context, 'sifre bos birakilamaz');
                      return;
                    }
                    if(passwordAgainController.text!=passwordController.text) {
                      showErrorMessage(context, 'sifreler uyusmuyor');
                      return;
                    }
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => LoginPage(),
                      ),
                    );
                    },
                  style: ElevatedButton.styleFrom(
                    primary: const Color(0xFFFFC600),
                  ),
                  child: const SmallText(
                    text: 'Yeni Sifre!',
                    color: Colors.black,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
