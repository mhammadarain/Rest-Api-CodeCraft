import 'package:api_practice_codecraft/models/to_do_list_model.dart';
import 'package:api_practice_codecraft/services/api_todo_list_services.dart';
import 'package:flutter/material.dart';

class ScreenTodoList extends StatefulWidget {
  const ScreenTodoList({super.key});

  @override
  State<ScreenTodoList> createState() => _ScreenTodoListState();
}

class _ScreenTodoListState extends State<ScreenTodoList> {

  bool isReady = false;
  List<ToDoListModel> todoListModel = [];
  _getTodoListData(){
    isReady = true;
    ApiToDoListServices().getToDoList().then((value){
      setState(() {
        todoListModel = value!;
        isReady = false;
      });
    });
  }


  @override
  void initState() {
    _getTodoListData();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("ToDo List"),
        backgroundColor: Colors.blueAccent,
      ),
      body: isReady == true? Center(child: CircularProgressIndicator(),):

          ListView.builder(
            itemCount: todoListModel.length,
              itemBuilder: (context, index){
                return Card(
                  child: ListTile(
                    title: Text(todoListModel[index].toString(), style: TextStyle(
                        decoration:  todoListModel[index].completed ? TextDecoration.lineThrough : TextDecoration.none,
                        fontSize: 16, fontWeight: FontWeight.w500,),),
                    trailing: Checkbox(
                      value: todoListModel[index].completed,
                      onChanged: (bool? value) {
                        setState(() {
                          todoListModel[index] =
                              todoListModel[index].copyWith(completed: value);
                        });
                      },
                    ),
                  ),
                );
              })
    );
  }
}
