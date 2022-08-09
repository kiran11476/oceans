import 'package:chennai/model/model_class.dart';
import 'package:chennai/model/service/service.dart';

import 'package:flutter/material.dart';

class ScreenHome extends StatefulWidget {
  const ScreenHome({Key? key}) : super(key: key);

  @override
  State<ScreenHome> createState() => _ScreenHomeState();
}

class _ScreenHomeState extends State<ScreenHome> {
  final TextEditingController search = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: const Text('Data'),
      ),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          children: [
            TextField(
              controller: search,
              onChanged: (value) {
                setState(() {});
              },
            ),
            FutureBuilder<ModelClass?>(
                future: HomeServices.getDatas(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    final List<Entry> datas =
                        snapshot.data!.entries!.where((element) {
                      if (element.api
                          .toLowerCase()
                          .contains(search.text.toLowerCase())) {
                        return true;
                      }
                      return false;
                    }).toList();
                    if (datas.isEmpty) {
                      return const Center(
                        child: Text('No data found'),
                      );
                    }
                    return ListView.builder(
                        itemCount: datas.length,
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        itemBuilder: (context, index) {
                          return ExpansionTile(
                              title: Text(datas[index].api),
                              children: [
                                Text(snapshot.data!.entries![index].description)
                              ]);
                        });
                  }
                  return const Center(child: CircularProgressIndicator());
                }),
          ],
        ),
      )),
    );
  }
}
