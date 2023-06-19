import 'package:flutter/material.dart';

import '../../models/help_models.dart';
import '../../services/help_service.dart';
import '../../widgets/general/text/largeText.dart';
import '../../widgets/general/text/mediumText.dart';
import '../../widgets/general/text/smallText.dart';

class AdminScreen extends StatefulWidget {
  const AdminScreen({Key? key}) : super(key: key);

  @override
  State<AdminScreen> createState() => _AdminScreenState();
}

class _AdminScreenState extends State<AdminScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: MediumText(
            text: "Yönetim Paneli", color: Colors.red),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              LargeText(
                  text: "Yardım ve Destek Talepleri",),
              SizedBox(
                height: 25,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.9,
                child: FutureBuilder(
                  future: DatabaseHandler().getHelps(),
                  builder: (context, AsyncSnapshot<List<HelpModel>> snap) {
                    if (snap.hasData) {
                      return ListView.builder(
                          physics: BouncingScrollPhysics(),
                          itemCount: snap.data!.length,
                          itemBuilder: (context, index) {
                            return Container(
                              margin: EdgeInsets.only(bottom: 15),
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      color: Colors.red),
                                  borderRadius: BorderRadius.circular(10)),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                      children: [
                                        Column(
                                          crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                          children: [
                                            SmallText(
                                                text: snap.data![index].name
                                                    .toString(),
                                                color: Colors.red),
                                            SmallText(
                                                text: snap.data![index].mail
                                                    .toString(),
                                                color: Colors.red),
                                          ],
                                        ),
                                        SmallText(
                                            text: snap.data![index].subject
                                                .toString(),
                                            color: Colors.red
                                        ),
                                      ],
                                    ),
                                    Divider(
                                      color: Colors.red,
                                      thickness: 1,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: SmallText(
                                          text: snap.data![index].message
                                              .toString(),
                                          color:
                                          Colors.red),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          });
                    } else {
                      return Text("Veri Yok");
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}