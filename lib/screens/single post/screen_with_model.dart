import 'package:api_practice_codecraft/services/api_single_post_services.dart';
import 'package:api_practice_codecraft/models/single_Post_model.dart';
import 'package:flutter/material.dart';

class ScreenWithModel extends StatefulWidget {
  const ScreenWithModel({super.key});

  @override
  State<ScreenWithModel> createState() => _ScreenWithModelState();
}

class _ScreenWithModelState extends State<ScreenWithModel> {

  bool isReady = false;

  SinglePostWithModel singlePostWithModel = SinglePostWithModel();
  _getSinglePost(){
    isReady = true;
    ApiSinglePostServices().getSinglePostWithModel().then((value){
      setState(() {
        singlePostWithModel = value!;
        isReady = false;
      });
    });
  }
  
@override
  void initState() {
    _getSinglePost();
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Single Post"),
      ),
      
      body: isReady == true? Center(child: CircularProgressIndicator(),):
      
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(singlePostWithModel.userId.toString(), style: TextStyle(fontSize: 22, color: Colors.teal),),
          Text(singlePostWithModel.title.toString(), style: TextStyle(fontSize: 20, color: Colors.tealAccent),),
          Text(singlePostWithModel.body.toString(), style: TextStyle(fontSize: 16,color: Colors.blueAccent),),
          Text(singlePostWithModel.id.toString(), style: TextStyle(fontSize: 22),)
        ],
      )
    );
  }
}
