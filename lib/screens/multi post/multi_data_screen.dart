import 'package:api_practice_codecraft/models/multi_data_model.dart';
import 'package:api_practice_codecraft/services/api_multi_data_services.dart';
import 'package:flutter/material.dart';

class MultiDataScreen extends StatefulWidget {
  const MultiDataScreen({super.key});

  @override
  State<MultiDataScreen> createState() => _MultiDataScreenState();
}

class _MultiDataScreenState extends State<MultiDataScreen> {

  MultiDataModel multiDataModel = MultiDataModel();
  bool isReady = false;

  _getMultiData(){
    isReady = true;
    ApiMuiltDataServices().getMultiDataWithModel().then((value){
      setState(() {
        multiDataModel = value!;
        isReady = false;
      });
    });
  }


  @override
  void initState() {
    _getMultiData();
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Multi Data With Model"),
        backgroundColor: Colors.green,
      ),

      body: isReady == true? Center(child: CircularProgressIndicator(),):

          Column(
            children: [
              Text(multiDataModel.page.toString()),
              Text(multiDataModel.total.toString()),
              Text(multiDataModel.support!.text.toString()),


              Expanded(
                  child: ListView.builder(
                    itemCount: multiDataModel.data!.length,
                      itemBuilder: (context, index){
                      return Card(
                        child: ListTile(
                          title: Text(multiDataModel.data![index].name.toString()),
                          subtitle: Text(multiDataModel.data![index].pantoneValue.toString()),
                        ),
                      );
                      }))
            ],
          )
    );
  }
}
