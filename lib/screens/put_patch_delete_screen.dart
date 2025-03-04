import 'package:api_practice_codecraft/models/put_patch_model.dart';
import 'package:api_practice_codecraft/services/api_delete_services.dart';
import 'package:api_practice_codecraft/services/api_put_patch_services.dart';
import 'package:flutter/material.dart';

class PutPatchDeleteScreen extends StatefulWidget {
  const PutPatchDeleteScreen({super.key});

  @override
  State<PutPatchDeleteScreen> createState() => _PutPatchDeleteScreenState();
}

class _PutPatchDeleteScreenState extends State<PutPatchDeleteScreen> {

  TextEditingController name = TextEditingController();
  TextEditingController job = TextEditingController();
  
  
  PutAndPatchModel putAndPatchModel = PutAndPatchModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Put, Patch & Delete"),
        backgroundColor: Colors.lightGreenAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(22.0),
        child: Column(
          children: [
            SizedBox(height: 200,),
            TextField(
              controller: name,
              decoration: InputDecoration(
                hintText: "Enter Name"
              ),
            ),
            SizedBox(height: 20,),
            TextField(
              controller: job,
              decoration: InputDecoration(
                hintText: "Enter Job"
              ),
            ),
            SizedBox(height: 50,),
            SizedBox(
              height: 50,
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.lightGreenAccent,
                  foregroundColor: Colors.black
                ),

                  onPressed: ()async{
                  Map<String, dynamic> args = {
                    "name": name.text,
                    "job": job.text
                  };
                  try {
                    PutAndPatchModel? result = await ApiPutPatchServices().patchJob(args, "2");
                    if (result != null) {
                      setState(() {
                        putAndPatchModel = result;
                      });
                    } else {
                      print("Update failed: Received null response");
                    }
                  } catch (e) {
                    print("Error: ${e.toString()}");
                  }


                  },
                  child: Text("Update")),
            ),
            SizedBox(height: 20,),
            SizedBox(
              height: 50,
              width: double.infinity,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.lightGreenAccent,
                      foregroundColor: Colors.black
                  ),

                  onPressed: ()async {
                    var data = await ApiDeleteServices().deleteJob("2");
                    print("Data => ${data.toString()}");
                  },
                  child: Text("Delete"),
            ),
            )
          ],
        ),
      ),
    );
  }
}
