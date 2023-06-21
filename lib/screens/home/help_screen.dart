import 'package:chat_by_me/widgets/general/text/mediumText.dart';
import 'package:chat_by_me/widgets/general/text/smallText.dart';
import 'package:flutter/material.dart';
import '../../models/help_models.dart';
import '../../services/help_service.dart';

class HelpAndSupportScreen extends StatefulWidget {
  const HelpAndSupportScreen({Key? key}) : super(key: key);

  @override
  State<HelpAndSupportScreen> createState() => _HelpAndSupportScreenState();
}

class _HelpAndSupportScreenState extends State<HelpAndSupportScreen> {
  List<HelpModel> helpModelList = [];

  TextEditingController nameController = TextEditingController();
  TextEditingController mailController = TextEditingController();
  TextEditingController subjectController = TextEditingController();
  TextEditingController messageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: const MediumText(
                text: "Yardım ve Destek", color: Colors.white),
            backgroundColor: const Color(0xFFFFC600),
            foregroundColor: Colors.white,
          ),
          body: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Padding(
                padding: const EdgeInsets.all(40),
                child: Column(
                  children: [
                    TextFormField(
                      controller: nameController,
                      decoration: InputDecoration(
                        hintText: 'Ad Soyad',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0),
                          borderSide: const BorderSide(color: Colors.black),
                        ),
                        filled: true,
                        fillColor: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 16.0),
                    TextFormField(
                      controller: mailController,
                      decoration: InputDecoration(
                        hintText: 'E-Posta',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0),
                          borderSide: const BorderSide(color: Colors.black),
                        ),
                        filled: true,
                        fillColor: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 16.0),
                    TextFormField(
                      controller: subjectController,
                      decoration: InputDecoration(
                        hintText: 'Konu',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0),
                          borderSide: const BorderSide(color: Colors.black),
                        ),
                        filled: true,
                        fillColor: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 16.0),
                    TextFormField(
                      controller: messageController,
                      decoration: InputDecoration(
                        hintText: 'Mesaj',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0),
                          borderSide: const BorderSide(color: Colors.black),
                        ),
                        filled: true,
                        fillColor: Colors.white,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    InkWell(
                      onTap: () async {
                        HelpModel model = HelpModel(
                            name: nameController.text,
                            mail: mailController.text,
                            subject: subjectController.text,
                            message: messageController.text);
                        await DatabaseHandler().insertHelps(model);
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return const AlertDialog(
                                title: MediumText(
                                    text: "Gönderildi!",
                                    color: Colors.black),
                                content: SmallText(
                                    text:
                                    "Tebrikler yardım talebinizi başarıyla ilettiniz.",
                                    color: Colors.red));
                          },
                        );
                      },
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.send_sharp,
                            size: 25,
                            color: Colors.black,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          SmallText(
                              text: "Gönder", color: Colors.black)
                        ],
                      ),
                    ),
                  ],
                ),
              )),
        )
    );
  }
}