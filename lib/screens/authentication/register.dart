import 'package:chat_by_me/auth.dart';
import 'package:chat_by_me/screens/authentication/login.dart';
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

  RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30.0),
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              // crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Logo
                const HeaderText(text: 'Kayıt Ol'),
                const SizedBox(height: 40.0),
                // Kullanıcı Adı Alanı
                TextFormField(
                  controller: nameController,
                  decoration: InputDecoration(
                    hintText: 'Ad Soyad',
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
                TextFormField(
                  controller: mailController,
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
                TextFormField(
                  controller: phoneController,
                  decoration: InputDecoration(
                    hintText: 'Telefon Numarası',
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
                TextFormField(
                  controller: passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    hintText: 'Şifre',
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
                TextFormField(
                  controller: passwordAgainController,
                  obscureText: true,
                  decoration: InputDecoration(
                    hintText: 'Tekrar Şifre',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                      borderSide: const BorderSide(color: Colors.grey),
                    ),
                    filled: true,
                    fillColor: Colors.white,
                  ),
                ),
                const SizedBox(height: 30.0),
                Container(
                  margin: const EdgeInsets.only(bottom: 20),
                  width: MediaQuery
                      .of(context)
                      .size
                      .width,
                  child: ElevatedButton(
                    onPressed: () {
                      UserModel user = UserModel(
                        phone: phoneController.text,
                        name: nameController.text,
                        email: mailController.text,
                        password: passwordController.text,
                      );
                      Auth()
                          .createUser(
                          mailController.text, passwordController.text, user)
                          .then((value)
                      {

                        Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => LoginPage(user: user),
                        ),
                      );
                    }
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.orange,
                    ),
                    child: const SmallText(
                      text: 'Kayıt Ol',
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
                const SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Hesabın var mı?',
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
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.bold),
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
