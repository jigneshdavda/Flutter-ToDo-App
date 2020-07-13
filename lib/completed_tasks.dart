import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_to_do/task_data_model.dart';

class MyCompletedTask extends StatefulWidget {
  @override
  _MyCompletedTaskState createState() => _MyCompletedTaskState();
}

class _MyCompletedTaskState extends State<MyCompletedTask> {
  final fireStoreDB = Firestore.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: StreamBuilder<QuerySnapshot>(
            stream: fireStoreDB
                .collection("todo-tasks")
                .where('task_status', isEqualTo: true)
                .snapshots(),
            builder:
                (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (!snapshot.hasData) {
                return Center(
                  child: Container(
                    child: Text("No task found."),
                  ),
                );
              } else {
                return ListView(
                  children: snapshot.data.documents
                      .map((taskData) => CheckboxListTile(
                            value: taskData['task_status'],
                            controlAffinity: ListTileControlAffinity.leading,
                            onChanged: (val) {
                              setState(() {
                                TaskDataModel()
                                    .updateTask(taskData.documentID, val);
                              });
                            },
                            title: Text(
                              taskData['task_name'].toString(),
                              style: TextStyle(
                                  decoration: taskData['task_status']
                                      ? TextDecoration.lineThrough
                                      : TextDecoration.none),
                            ),
                          ))
                      .toList(),
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
