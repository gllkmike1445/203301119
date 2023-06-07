import 'package:chat_by_me/auth.dart';
import 'package:chat_by_me/screens/authentication/register.dart';
import 'package:chat_by_me/screens/home/navigation_bar.dart';
import 'package:chat_by_me/widgets/general/text/headerText.dart';
import 'package:chat_by_me/widgets/general/text/smallText.dart';
import 'package:flutter/material.dart';

import '../../models/user.dart';
import '../../widgets/general/text/largeText.dart';
import 'create_password.dart';
import 'login.dart';

void showErrorMessage(BuildContext context, String errorMessage) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(errorMessage),
      backgroundColor: Colors.red,
    ),
  );
}

class ForgotPassword extends StatelessWidget {
  final mailController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  ForgotPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30.0),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Logo
                const HeaderText(text: 'Chat By Me'),
                const LargeText(text: 'Hoşgeldin!'),
                const SizedBox(height: 40.0),
                // Kullanıcı Adı Alanı
                TextFormField(
                  controller: mailController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter email';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    hintText: 'E-Posta',
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
                      if(!_formKey.currentState!.validate()) return;

                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => CreatePassword(),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      primary: const Color(0xFFFFC600),
                    ),
                    child: const SmallText(
                      text: 'Sifreyi Sıfırla!',
                      color: Colors.black,
                    ),
                  ),
                ),
                Row(
                  children: const [
                    Expanded(
                      child: Divider(
                        color: Colors.black,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10.0),
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
                const SizedBox(height: 50),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Hesabın yok mu?',
                      style: TextStyle(
                        fontSize: 14,
                      ),
                    ),
                    const SizedBox(width: 5),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => RegisterPage(),
                          ),
                        );
                      },
                      child: const Text(
                        'Kayıt Ol...',
                        style:
                        TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      '',
                      style: TextStyle(
                        fontSize: 14,
                      ),
                    ),
                    const SizedBox(width: 5),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => LoginPage(),
                          ),
                        );
                      },
                      child: const Text(
                        'Giriş Yap',
                        style:
                        TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                      ),
                    )
                  ],
                ),
                // Giriş ve Kayıt Ol Butonları
              ],
            ),
          ),
        ),
      ),
    );
  }
}
