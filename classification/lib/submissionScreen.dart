// ignore_for_file: file_names
import 'package:classification/homepage.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';

class SubmissionScreen extends StatelessWidget {
  final File? imageFile;
  final String oName, uID, rID;
  const SubmissionScreen(
      {super.key,
      this.imageFile,
      required this.oName,
      required this.uID,
      required this.rID});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var height = size.height;
    var width = size.width;
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
                colors: [
              Color.fromRGBO(36, 69, 60, 1),
              Color.fromRGBO(110, 160, 123, 1)
            ])),
        child: SafeArea(
          child: Center(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              if (imageFile != null)
                Image.file(
                  imageFile!,
                  width: width,
                ),
              const SizedBox(
                height: 10,
              ),
              Container(
                height: (height * 0.195) - 3.2,
                width: width,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(25),
                    topRight: Radius.circular(25),
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      "Owner \t\t\t\t\t\t\t\t: $oName",
                      style: const TextStyle(
                          fontSize: 17, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'Unique ID \t\t: $uID',
                      style: const TextStyle(
                          fontSize: 17, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'RF ID \t\t\t\t\t\t\t\t\t\t: $rID',
                      style: const TextStyle(
                          fontSize: 17, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      width: 150,
                      height: 50,
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              elevation: 3,
                              backgroundColor:
                                  const Color.fromRGBO(36, 69, 60, 1)),
                          onPressed: () {
                            String filename =
                                "${oName}_${uID}_${DateTime.now()}";
                            Reference referenceRoot =
                                FirebaseStorage.instance.ref();
                            Reference refDir = referenceRoot.child('Images');
                            Reference refImage = refDir.child(filename);
                            Map<String, String> custommetadata = {
                              'Owner': oName,
                              'Unique ID': uID,
                              'RF ID': rID,
                              'File name': filename,
                              'time created': DateTime.now().toString()
                            };

                            final task = refImage.putFile(
                                File(imageFile!.path),
                                SettableMetadata(
                                    customMetadata: custommetadata));
                            task.whenComplete(() => {
                                  Navigator.of(context).pushReplacement(
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const MyHomePage()))
                                });

                            const snackbar = SnackBar(
                              content: Text('Uploaded'),
                            );

                            ScaffoldMessenger.of(context)
                                .showSnackBar(snackbar);
                          },
                          child: const Text('Upload')),
                    )
                  ],
                ),
              )
            ],
          )),
        ),
      ),
    );
  }
}
