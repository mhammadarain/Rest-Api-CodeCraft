import 'package:api_practice_codecraft/services/api_multi_data_services.dart';
import 'package:flutter/material.dart';

class MultiDataWithoutModelScreen extends StatefulWidget {
  const MultiDataWithoutModelScreen({super.key});

  @override
  State<MultiDataWithoutModelScreen> createState() => _MultiDataWithoutModelScreenState();
}

class _MultiDataWithoutModelScreenState extends State<MultiDataWithoutModelScreen> {
  
  bool isReady = false;
  dynamic multiData;
  _getMultiDataWithoutModel(){
    isReady = true;
    ApiMuiltDataServices().getMultiDataWithoutModel().then((value){
      setState(() {
        multiData = value;
        isReady = false;
      });
    });
  }
  
  @override
  void initState() {
    _getMultiDataWithoutModel();
    super.initState();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Multi Data Without Model"),
        backgroundColor: Colors.green,
      ),
      
      body: isReady == true? Center(child: CircularProgressIndicator(),):
          
          Column(
            children: [
              Text(multiData["page"].toString()),
              Text(multiData["total"].toString()),


              Expanded(child:
              ListView.builder(
                itemCount: multiData["data"].length,
                  itemBuilder: (context, index){
                  return Card(
                    child: ListTile(
                      leading: CircleAvatar(
                        child: Text(multiData["data"][index]["id"].toString()),
                      ),
                      title: Text(multiData["data"][index]["name"].toString()),
                      subtitle: Text(multiData["data"][index]["pantone_value"].toString()),
                    ),
                  );
                  }))
            ],
          )
    );
  }
}
