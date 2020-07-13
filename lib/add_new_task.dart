import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_to_do/task_data_model.dart';

class MyAddNewTask extends StatefulWidget {
  @override
  _MyAddNewTaskState createState() => _MyAddNewTaskState();
}

class _MyAddNewTaskState extends State<MyAddNewTask> {
  TextEditingController _taskTitle = new TextEditingController();
  TextEditingController _taskDescription = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('Add New Task'),
        elevation: 0,
      ),
      body: Container(
        padding: EdgeInsets.all(10),
        child: Card(
          elevation: 4,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(12),
                child: TextField(
                  textCapitalization: TextCapitalization.sentences,
                  controller: _taskTitle,
                  cursorColor: Theme.of(context).primaryColor,
                  decoration: InputDecoration(hintText: 'Title'),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(12),
                child: TextField(
                  textCapitalization: TextCapitalization.sentences,
                  cursorColor: Theme.of(context).primaryColor,
                  controller: _taskDescription,
                  decoration: InputDecoration(hintText: 'Take a note...'),
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          TaskDataModel().addTask(_taskTitle.text, _taskDescription.text);
          Navigator.pop(context);
        },
        label: Text('Save task'),
        tooltip: 'Save task',
        icon: Icon(Icons.check),
      ),
    );
  }
}
