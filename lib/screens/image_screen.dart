import 'dart:typed_data';
import 'package:flutter/material.dart';
// import 'dart:html';  // For web
// import 'dart:io';    // For iOS/Android
import 'package:image_picker/image_picker.dart';
import 'package:api_practice_codecraft/services/api_image_services.dart';

class ImageScreen extends StatefulWidget {
  const ImageScreen({super.key});

  @override
  State<ImageScreen> createState() => _ImageScreenState();
}

class _ImageScreenState extends State<ImageScreen> {
  bool isLoading = false;
  String uploadedImage = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Android & Web", style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.amber,
      ),
      body: Center(
        child: isLoading
            ? CircularProgressIndicator(color: Colors.amber)
            : Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            uploadedImage.isNotEmpty
                ? Container(
              height: 200,
              width: 200,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(uploadedImage),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.circular(10),
              ),
            )
                : SizedBox(),

            const SizedBox(height: 20),

            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.amber,
                foregroundColor: Colors.white,
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              ),
              onPressed: () async {
                final ImagePicker picker = ImagePicker();
                final XFile? image = await picker.pickImage(source: ImageSource.gallery);

                if (image != null) {
                  setState(() {
                    isLoading = true;
                  });

                  Uint8List bytes = await image.readAsBytes();

                  ApiImageServices().uploadImage(bytes, image.name).then((value) {
                    setState(() {
                      uploadedImage = value["location"].toString();
                      isLoading = false;
                    });
                  }).catchError((error) {
                    setState(() {
                      isLoading = false;
                    });
                    print("Error uploading image: $error");
                  });
                }
              },
              child: Text("Upload Image"),
            ),
          ],
        ),
      ),
    );
  }
}
