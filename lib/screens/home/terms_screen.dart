import 'package:flutter/material.dart';

import '../../services/file_utils.dart';
import '../../widgets/general/text/mediumText.dart';

class TermsAndConditionsScreen extends StatelessWidget {
  const TermsAndConditionsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
        centerTitle: true,
          title: const MediumText(text: "Şartlar ve Koşullar", color: Colors.black),
          backgroundColor: Colors.yellow,
          foregroundColor: Colors.black,
        ),
        body: Padding(
          padding: const EdgeInsets.all(40),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Divider(
                  height: 40,
                  color: Colors.black,
                  thickness: 1,
                ),
                GestureDetector(
                  onDoubleTap: () {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text("Gizlilik Sözleşmesi Kabul Edildi!")));
                    FileUtils.saveToFile("Kabul Edildi");
                  },
                  onLongPress: () {
                    FileUtils.readFromFile().then((value) =>
                        ScaffoldMessenger.of(context)
                            .showSnackBar(SnackBar(content: Text(value))));
                  },
                  child: const Text(
                    "Lütfen sitemizi kullanmadan evvel kullanım şartları’nı dikkatlice okuyunuz. Bu web sitesini kullanan ve iletişim halinde olan kullanıcılarımız aşağıdaki şartları kabul etmiş varsayılmaktadır:Sitemizdeki web sayfaları ve ona bağlı tüm sayfalar Catchrop firmasının malıdır ve onun tarafından işletilir. Sizler (Kullanıcı) sitede sunulan tüm hizmetleri kullanırken aşağıdaki şartlara tabi olduğunuzu, sitedeki hizmetten yararlanmakla ve kullanmaya devam etmekle; Bağlı olduğunuz yasalara göre sözleşme imzalama hakkına, yetkisine ve hukuki ehliyetine sahip ve 18 yaşın üzerinde olduğunuzu, bu sözleşmeyi okuduğunuzu, anladığınızı ve sözleşmede yazan şartlarla bağlı olduğunuzu kabul etmiş sayılırsınız.İşbu sözleşme taraflara sözleşme konusu site ile ilgili hak ve yükümlülükler yükler ve taraflar işbu sözleşmeyi kabul ettiklerinde bahsi geçen hak ve yükümlülükleri eksiksiz, doğru, zamanında, işbu sözleşmede talep edilen şartlar dahilinde yerine getireceklerini beyan ederler.",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 13,
                        fontFamily: "Poppins",
                        fontWeight: FontWeight.w400),
                    textAlign: TextAlign.center,
                  ),
                ),
                const Divider(
                  height: 40,
                  color: Colors.black,
                  thickness: 1,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
