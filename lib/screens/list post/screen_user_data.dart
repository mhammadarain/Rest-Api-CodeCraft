import 'package:api_practice_codecraft/models/user_data_model.dart';
import 'package:api_practice_codecraft/services/api_user_data_services.dart';
import 'package:flutter/material.dart';

class ScreenUserData extends StatefulWidget {
  const ScreenUserData({super.key});

  @override
  State<ScreenUserData> createState() => _ScreenUserDataState();
}

class _ScreenUserDataState extends State<ScreenUserData> {

  bool isReady = false;
  List<UserDataModel> userDataModel = [];
  _getUserData(){
    isReady = true;
    ApiUserDataServices().getUserDataPost().then((value){
      setState(() {
        userDataModel = value!;
        isReady = false;
      });
    });
  }

  @override
  void initState() {
    _getUserData();
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("User Data With Model"),
        backgroundColor: Colors.indigo,
      ),

      body: isReady == true? Center(child: CircularProgressIndicator(),):

          ListView.builder(
            itemCount: userDataModel.length,
              itemBuilder: (context, index){
              return Card(
                margin: EdgeInsets.all(11),
                color: Colors.white60,
                child: ListTile(
                  leading: Text(userDataModel[index].id.toString()),
                  title: Text(userDataModel[index].name.toString()),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Email: ${userDataModel[index].email.toString()}", style: TextStyle(color: Colors.green),),
                      Text(userDataModel[index].body.toString())
                    ],
                  ),
                ),
              );
              })
    );
  }
}
