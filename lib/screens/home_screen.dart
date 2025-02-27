import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  //final String? token;
  final String? id;
  final String? name;
  final String? job;
  final String? time;
  const HomeScreen({super.key,
    // this.token,
   this.id,
    this.name,
    this.job,
    this.time
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
           // Text("Token: ${widget.token}",textScaleFactor: 2,),

            SizedBox(height: 100,),

            Text("Id: ${widget.id}",textScaleFactor: 2,),
            Text("Name: ${widget.name}",textScaleFactor: 2,),
            Text("Job: ${widget.job}",textScaleFactor: 2,),
            Text("CreatedAt: ${widget.time}",textScaleFactor: 1,),
          ],
        ),
      ),
    );
  }
}
