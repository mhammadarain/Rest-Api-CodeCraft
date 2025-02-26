import 'package:api_practice_codecraft/services/api_single_post_services.dart';
import 'package:flutter/material.dart';

class ScreenWithoutModel extends StatefulWidget {
  const ScreenWithoutModel({super.key});

  @override
  State<ScreenWithoutModel> createState() => _ScreenWithoutModelState();
}

class _ScreenWithoutModelState extends State<ScreenWithoutModel> {

  dynamic singlePost;
  bool isReady = false;

  _getSinglePostWithoutModel(){
    isReady = true;
    ApiSinglePostServices().getSinglePostWithoutModel().then((value){
      setState(() {
        singlePost = value;
        isReady = false;
      });
    });
  }


  @override
  void initState() {
    _getSinglePostWithoutModel();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Post Without Model"),
      ),
      
      body: isReady == true? Center(child: CircularProgressIndicator(),):
      
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(singlePost["userId"].toString(), style: TextStyle(fontSize: 22,color: Colors.indigo),),
              Text(singlePost["title"].toString(), style: TextStyle(fontSize: 18,color: Colors.blue),),
              Text(singlePost["body"].toString(), style: TextStyle(fontSize: 15,color: Colors.blueAccent),)
            ],
          )


    );
  }
}
