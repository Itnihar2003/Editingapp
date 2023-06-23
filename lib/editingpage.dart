import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class editingpage extends StatefulWidget {
  final imagepath;
  const editingpage({super.key, this.imagepath});

  @override
  State<editingpage> createState() => _editingpageState();
}

class _editingpageState extends State<editingpage> {
  // crop(dynamic source2) {
  //   Future<CroppedFile?> croppedFile =
  //       ImageCropper().cropImage(sourcePath: source2.path);
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 21, 19, 19),
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          "EDITING PAGE",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Center(
            child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
          child: Column(
            children: [
              Row(
                children: [
                  Text(
                    "Selected Image :",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              SizedBox(
                height: 80,
              ),
              Image.file(File(widget.imagepath)),
            ],
          ),
        )),
      ),
      bottomNavigationBar: GNav(
          textStyle: TextStyle(color: Colors.white),
          iconSize: 25,
          backgroundColor: Colors.black,
          color: Colors.white,
          tabs: [
            GButton(
              icon: Icons.crop,
              onPressed: () {},
              text: "Crop",
            ),
            GButton(
              icon: Icons.text_fields,
              onPressed: () {},
              text: "Text",
            ),
            GButton(
              icon: Icons.edit,
              onPressed: () {},
              text: "Edit",
            )
          ]),
    );
  }
}
