import 'package:api_practice_codecraft/models/list_post_model.dart';
import 'package:api_practice_codecraft/services/api_list_post_services.dart';
import 'package:flutter/material.dart';
class ScreenListPost extends StatefulWidget {
  const ScreenListPost({super.key});

  @override
  State<ScreenListPost> createState() => _ScreenListPostState();
}

class _ScreenListPostState extends State<ScreenListPost> {

  bool isReady = false;
  List<ListPostWithModel> listPostModel = [];
  _getPost(){
    isReady = true;
    ApiListPostServices().getListPost().then((value){
      setState(() {
        listPostModel = value!;
        isReady = false;
      });
    });
  }

  @override
  void initState() {
    _getPost();
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("List View Post"),
        backgroundColor: Colors.teal,
      ),
      body: isReady == true? Center(child: CircularProgressIndicator(),):
      ListView.builder(
        itemCount: listPostModel.length,
          itemBuilder: (context, index){
          return Card(
            margin: EdgeInsets.all(10),
            child: ListTile(
              leading: Text(listPostModel[index].id.toString()),
              title: Text(listPostModel[index].title.toString()),
              subtitle: Text(listPostModel[index].body.toString()),
            ),
          );
          })
    );
  }
}
