import 'package:flutter/material.dart';
import 'package:flutter_to_do/add_new_task.dart';
import 'package:flutter_to_do/all_tasks.dart';
import 'package:flutter_to_do/completed_tasks.dart';
import 'package:flutter_to_do/pending_tasks.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ToDo App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.green,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'ToDo App'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _currentIndex = 0;
  AppLifecycleState _lastLifecycleState;

  final List<Widget> _children = [
    MyAllTasks(),
    MyPendingTask(),
    MyCompletedTask()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        elevation: 0,
      ),
      body: _children[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (int index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(Icons.all_out), title: Text('ALL')),
          BottomNavigationBarItem(
              icon: Icon(Icons.lock_open), title: Text('PENDING')),
          BottomNavigationBarItem(
              icon: Icon(Icons.compare_arrows), title: Text('COMPLETED')),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => MyAddNewTask(),
            ),
          );
        },
        tooltip: 'New Task',
        label: Text('Add a new task'),
        icon: Icon(Icons.add),
      ),
    );
  }
}
