import 'dart:io';

import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';import 'package:image_picker/image_picker.dart';
import 'package:imageapp/editingpage.dart';

class imagepick extends StatefulWidget {
  const imagepick({super.key});

  @override
  State<imagepick> createState() => _imagepickState();
}

class _imagepickState extends State<imagepick> {

  List<XFile> emptylist = [];
  final ImagePicker imagePicker = ImagePicker();
  pick(ImageSource source1) async {
    final XFile? image = await imagePicker.pickImage(source: source1);
    image == null ? Text("no image") : emptylist.add(image);

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          "PICKED IMAGE",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Container(
        color: Color.fromARGB(255, 17, 17, 17),
        child: Column(children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(6.0),
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                ),
                itemCount: emptylist.length,
                itemBuilder: (BuildContext context, int index) {
                  return TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => editingpage(
                                imagepath: emptylist[index].path,
                              ),
                            ));
                      },
                      child: Image.file(
                        File(emptylist[index].path),
                        height: 200,
                        width: 200,
                        fit: BoxFit.fill,
                      ));
                },
              ),
            ),
          )
        ]),
      ),
      bottomNavigationBar: Container(
        color: Colors.black,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.amber,
                    ),
                    onPressed: () {
                      pick(ImageSource.gallery);
                    },
                    child: Row(
                      children: [
                        Icon(Icons.file_copy),
                        Text("gallary"),
                      ],
                    )),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: ElevatedButton(
                    style:
                        ElevatedButton.styleFrom(backgroundColor: Colors.amber),
                    onPressed: () {
                      pick(ImageSource.camera);
                    },
                    child: Row(
                      children: [
                        Icon(Icons.camera),
                        Text("camera"),
                      ],
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
