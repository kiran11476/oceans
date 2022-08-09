import 'package:chennai/model/model_class.dart';
import 'package:chennai/model/service/service.dart';

import 'package:flutter/material.dart';

class ScreenHome extends StatelessWidget {
  const ScreenHome({Key? key}) : super(key: key);

  // final values = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Data'),
      ),
      body: SafeArea(
          child: FutureBuilder<ModelClass?>(
              future: HomeServices.getDatas(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return ListView.builder(
                      itemCount: snapshot.data!.count,
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      itemBuilder: (context, index) {
                        return ExpansionTile(
                            title: Text(snapshot.data!.entries![index].api),
                            children: [
                              Text(snapshot.data!.entries![index].description)
                            ]);
                      });
                }
                return const Center(child: CircularProgressIndicator());
              })),
    );
  }
}
