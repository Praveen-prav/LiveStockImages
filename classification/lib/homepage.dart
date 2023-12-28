import 'dart:io';
// import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'dart:core';
import 'package:image_picker/image_picker.dart';
import 'submissionScreen.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final mycontroller = TextEditingController();
  late String ownerName;
  late String uniqueId;
  late String rfId;

  final ImagePicker picker = ImagePicker();
  File? _imageFile;

  @override
  void dispose() {
    mycontroller.dispose();
    super.dispose();
  }

  Future<void> _captureImage() async {
    final XFile? image = await picker.pickImage(source: ImageSource.camera);

    if (image != null) {
      setState(() {
        _imageFile = File(image.path);
      });

      // ignore: use_build_context_synchronously
      Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => SubmissionScreen(
            imageFile: _imageFile, oName: ownerName, uID: uniqueId, rID: rfId),
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          // title: const Text(
          //   'classification1',
          //   style: TextStyle(color: Colors.white),
          // ),
        ),
        body: Container(
          height: double.maxFinite,
          width: double.maxFinite,
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  colors: [
                Color.fromRGBO(36, 69, 60, 1),
                Color.fromRGBO(110, 160, 123, 1),
              ])),
          child: SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  margin: const EdgeInsets.fromLTRB(0, 0, 0, 30),
                  child: const Text(
                    'LiveStockLens',
                    style: TextStyle(
                      fontSize: 30,
                      color: Colors.white,
                    ),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 36, vertical: 10),
                  child: TextField(
                    style: const TextStyle(color: Colors.white),
                    decoration: const InputDecoration(
                        filled: true,
                        fillColor: Color.fromARGB(72, 255, 255, 255),
                        border: InputBorder.none,
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white)),
                        labelText: 'Owner name',
                        labelStyle: TextStyle(color: Colors.white)),
                    onChanged: (value) => {ownerName = value},
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 36, vertical: 10),
                  child: TextField(
                    style: const TextStyle(color: Colors.white),
                    decoration: const InputDecoration(
                        filled: true,
                        fillColor: Color.fromARGB(72, 255, 255, 255),
                        border: InputBorder.none,
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white)),
                        labelText: 'Unique ID',
                        labelStyle: TextStyle(color: Colors.white)),
                    onChanged: (value) => {uniqueId = value},
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 36, vertical: 10),
                  child: TextField(
                    style: const TextStyle(color: Colors.white),
                    decoration: const InputDecoration(
                        filled: true,
                        fillColor: Color.fromARGB(72, 255, 255, 255),
                        border: InputBorder.none,
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white)),
                        labelText: 'RF ID',
                        labelStyle: TextStyle(color: Colors.white)),
                    onChanged: (value) => {rfId = value},
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(6)),
                    gradient: LinearGradient(
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                      colors: <Color>[
                        Color.fromRGBO(36, 69, 60, 1),
                        Color.fromRGBO(110, 160, 123, 1)
                      ],
                    ),
                  ),
                  child: TextButton(
                      style: TextButton.styleFrom(
                          fixedSize: const Size(150, 50),
                          foregroundColor: Colors.white,
                          padding: const EdgeInsets.all(16),
                          textStyle: const TextStyle(fontSize: 15)),
                      onPressed: () async => {_captureImage()},
                      child: const Text("Image")),
                )
              ],
            ),
          ),
        ));
  }
}
