import 'package:api_practice_codecraft/models/complex_list_model.dart';
import 'package:api_practice_codecraft/services/api_complex_list_services.dart';
import 'package:flutter/material.dart';

class ScreenComplexList extends StatefulWidget {
  const ScreenComplexList({super.key});

  @override
  State<ScreenComplexList> createState() => _ScreenComplexListState();
}

class _ScreenComplexListState extends State<ScreenComplexList> {

  bool isReady = false;
  List<ComplexListModel> complexList = [];
  _getComplexData(){
    isReady = true;
    ApiComplexListServices().getComplexList().then((value){
      setState(() {
        complexList = value!;
        isReady = false;
      });
    });
  }

  @override
  void initState() {
    _getComplexData();
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Complex List Data"),
        backgroundColor: Colors.orange,
      ),

      body: isReady == true? Center(child: CircularProgressIndicator(),):

          ListView.builder(
            itemCount: complexList.length,
              itemBuilder: (context,index){
            return Card(
              child: ListTile(
                title: Text(complexList[index].name.toString()),
                subtitle: Text(complexList[index].address!.city.toString()),
                trailing: Text(complexList[index].address!.suite.toString()),
              ),
            );
          })
    );
  }
}
