import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' as p;

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  File? pickedImage;

  Future selectImageFromDevice(ImageSource imageType) async {
    try {
      final photo = await ImagePicker().pickImage(source: imageType);
      if (photo == null) return;
      final tempImage = File(photo.path);
      setState(() {
        pickedImage = tempImage;
      });
    } catch (error) {
      debugPrint(error.toString());
    }

    //final appDir = await syspaths.getApplicationDocumentsDirectory();
    //final fileName = path.basename(photo.path);
    //final savedImage = await photo.copy('${appDir.path}/$fileName');g
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          "pick image from gallery",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w200,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        bottomOpacity: 0.0,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Container(
                height: 200.0,
                child: Center(
                  child: ClipOval(
                    child: pickedImage != null
                        ? Image.file(pickedImage!, fit: BoxFit.cover)
                        : Text(
                            "please select image from gallery",
                            style: TextStyle(fontSize: 20),
                          ),
                  ),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 100),
              child: Center(
                child: ElevatedButton(
                  onPressed: () {
                    showModalBottomSheet(
                        backgroundColor: Theme.of(context).primaryColor,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(20),
                                topRight: Radius.circular(20))),
                        isDismissible: false,
                        enableDrag: true,
                        elevation: 0,
                        context: context,
                        builder: (context) {
                          return Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Center(
                                child: TextButton(
                                  onPressed: () {
                                    selectImageFromDevice(ImageSource.gallery);
                                  },
                                  child: Text(
                                    " From gallery",
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w200,
                                        color: Colors.black),
                                  ),
                                ),
                              ),
                              Center(
                                child: TextButton(
                                  onPressed: () {
                                    selectImageFromDevice(ImageSource.camera);
                                  },
                                  child: Text(
                                    " From Camera",
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w200,
                                        color: Colors.black),
                                  ),
                                ),
                              ),
                            ],
                          );
                        });
                  },
                  child: Text(
                    " choose",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w200,
                        color: Colors.white),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
