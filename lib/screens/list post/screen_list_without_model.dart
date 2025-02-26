import 'package:api_practice_codecraft/services/api_list_post_services.dart';
import 'package:flutter/material.dart';

class ScreenListWithoutModel extends StatefulWidget {
  const ScreenListWithoutModel({super.key});

  @override
  State<ScreenListWithoutModel> createState() => _ScreenListWithoutModelState();
}

class _ScreenListWithoutModelState extends State<ScreenListWithoutModel> {

  // bool isReady = true;
  // dynamic postList = [];
  // _getPost(){
  //   isReady = true;
  //   ApiListPostServices().getPostWithOutModel().then((value){
  //     setState(() {
  //       postList = value;
  //       isReady = false;
  //     });
  //   });
  // }
  //
  //
  // @override
  // void initState() {
  //   _getPost();
  //   super.initState();
  // }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("List Post Without Model"),
        backgroundColor: Colors.blue,
      ),

      // body: isReady == true? Center(child: CircularProgressIndicator()):
      //     ListView.builder(
      //       itemCount: postList.length,
      //         itemBuilder: (context, index){
      //       return Card(
      //         margin: EdgeInsets.all(10),
      //         child: ListTile(
      //           leading: Text(postList[index]["id"].toString()),
      //           title: Text(postList[index]["title"].toString()),
      //           subtitle: Text(postList[index]["body"].toString()),
      //         ),
      //       );
      //     })


      body: FutureBuilder(
          future: ApiListPostServices().getPostWithOutModel(),
          builder: (context, snapshot){
            return ListView.builder(
              itemCount: snapshot.data.length,
                itemBuilder: (context, index){
                if(snapshot.hasData) {
                  return Card(
                    margin: EdgeInsets.all(11),
                    child: ListTile(
                      title: Text(snapshot.data[index]["title"].toString()),
                      subtitle: Text(snapshot.data[index]["body"].toString()),
                    ),
                  );
                }else{
                  return Center(child: CircularProgressIndicator(),);
                }
            });
          }),

    );
  }
}
