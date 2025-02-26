import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  final String? token;
  const HomeScreen({super.key, this.token});

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

      body: Center(
        child: Text("Token: ${widget.token}",textScaleFactor: 2,),
      ),
    );
  }
}
