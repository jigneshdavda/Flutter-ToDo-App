import 'package:cloud_firestore/cloud_firestore.dart';

class TaskDataModel {
  String name;
  bool value;

  final fireStoreDB = Firestore.instance;

  Future<void> addTask(taskName, taskDescription) async {
    await fireStoreDB.collection("todo-tasks").add({
      'task_name': taskName,
      'task_description': taskDescription,
      'task_status': false
    }).then((documentReference) {
      print(documentReference.documentID);
    }).catchError((e) {
      print(e);
    });
  }

  Future<void> updateTask(documentID, taskStatus) async {
    await fireStoreDB.collection("todo-tasks").document(documentID).updateData({
      'task_status': taskStatus,
    }).then((documentReference) {
      print("Document Updated.");
    }).catchError((e) {
      print(e);
    });
  }
}
