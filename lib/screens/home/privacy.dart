import 'package:flutter/material.dart';

class PrivacyPage extends StatelessWidget {
  const PrivacyPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFFFC600),
        title: const Text('Gizlilik Politikası'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text(
                'Veri Toplama ve Kullanımı',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20.0,
                ),
              ),
              SizedBox(height: 10.0),
              Text(
                'Uygulamamızın kullanımı sırasında bazı kişisel bilgilerinizi toplamak zorunda kalabiliriz. Bu bilgiler, uygulamanın kullanımıyla ilgili analizler yapmak, uygulamayı geliştirmek veya hizmet sunmak için gereklidir.',
              ),
              SizedBox(height: 20.0),
              Text(
                'Veri Paylaşımı',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20.0,
                ),
              ),
              SizedBox(height: 10.0),
              Text(
                'Topladığımız kişisel bilgilerinizi asla üçüncü taraflarla paylaşmayız. Ancak, kanunen gerektiği durumlarda bilgilerinizi yetkili makamlara iletebiliriz.',
              ),
              SizedBox(height: 20.0),
              Text(
                'Çerezler',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20.0,
                ),
              ),
              SizedBox(height: 10.0),
              Text(
                'Uygulamamız, kullanıcı deneyimini iyileştirmek için çerezleri kullanabilir. Bu çerezler, kullanıcının tercihlerini hatırlamak veya reklamları hedeflemek için kullanılabilir.',
              ),
              SizedBox(height: 20.0),
              Text(
                'Değişiklikler',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20.0,
                ),
              ),
              SizedBox(height: 10.0),
              Text(
                'Gizlilik politikamızda değişiklik yapma hakkımızı saklı tutarız. Bu sayfayı düzenli olarak kontrol etmenizi öneririz.',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
