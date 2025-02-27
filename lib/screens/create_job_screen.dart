import 'package:api_practice_codecraft/models/create_job_model.dart';
import 'package:api_practice_codecraft/screens/home_screen.dart';
import 'package:api_practice_codecraft/services/api_create_job_services.dart';
import 'package:flutter/material.dart';

class CreateJobScreen extends StatefulWidget {
  const CreateJobScreen({super.key});

  @override
  State<CreateJobScreen> createState() => _CreateJobScreenState();
}

class _CreateJobScreenState extends State<CreateJobScreen> {

  TextEditingController name = TextEditingController();
  TextEditingController job = TextEditingController();

  CreateJobModel createJobModel = CreateJobModel();

  bool isReady = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Create Job",style: TextStyle(color: Colors.white),),
        backgroundColor: Colors.green,
      ),

      body: Padding(
        padding: const EdgeInsets.all(50.0),
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
                  onPressed: (){
                    setState(() {
                      isReady = true;
                    });

                    ApiCreateJobServices().createJob(name.text.toString(), job.text.toString()).then((value){
                      setState(() {
                        isReady = false;
                        createJobModel = value!;

                        Navigator.push(context, MaterialPageRoute(builder: (context)=>HomeScreen(
                          id: createJobModel.id.toString(),
                          name: createJobModel.name.toString(),
                          job: createJobModel.job.toString(),
                          time: createJobModel.createdAt.toString()
                        )));
                      });
                    });
                  },
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.green,foregroundColor: Colors.white),
                  child:isReady == true? Center(child: CircularProgressIndicator(color: Colors.white,),):Text("Create Job")),
            )
          ],
        ),
      ),
    );
  }
}
