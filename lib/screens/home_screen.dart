import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {

  //for login
  //final String? token;

  //for register
  final String? id, token;

  //for create job
  //final String? id, name, job, time;


  const HomeScreen({super.key,

    //for login
    // this.token,

    //for register
    this.id, this.token

    //for create job
   //this.id, this.name, this.job, this.time

  });

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Home Screen",style: TextStyle(color: Colors.white),),
        backgroundColor: Colors.blueGrey,
      ),

      body:  Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 100,),

            //for login
           // Text("Token: ${widget.token}",textScaleFactor: 2,),


            //for register
            Text("Id: ${widget.id}",textScaleFactor: 2),
            Text("Token: ${widget.token}",textScaleFactor: 2),


            //for create job
            // Text("Id: ${widget.id}",textScaleFactor: 2,),
            // Text("Name: ${widget.name}",textScaleFactor: 2,),
            // Text("Job: ${widget.job}",textScaleFactor: 2,),
            // Text("CreatedAt: ${widget.time}",textScaleFactor: 1,),
          ],
        ),
      ),
    );
  }
}
