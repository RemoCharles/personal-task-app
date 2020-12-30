import 'package:flutter/material.dart';
import 'package:task_app/classes/styles.dart';
import 'package:task_app/classes/task.dart';
import 'package:task_app/classes/task_data.dart';
import 'package:task_app/pages/create_task.dart';

class Home extends StatefulWidget {
  Home({Key key}) : super(key: key);
  @override
  createState() => new HomeState();
}

class HomeState extends State<Home> {
  void _removeTodoItem(int index) {
    setState(() => TaskData.tasks.removeAt(index));
  }

  void _promptRemoveTodoItem(int index) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return new AlertDialog(
              title:
                  new Text('Mark task as done?', style: Styles.textLowerTitle),
              actions: <Widget>[
                new FlatButton(
                    child: new Text(
                      'CANCEL',
                      style: Styles.textText,
                    ),
                    // The alert is actually part of the navigation stack, so to close it, we
                    // need to pop it.
                    onPressed: () => Navigator.of(context).pop()),
                new FlatButton(
                    child: new Text('MARK AS DONE', style: Styles.textText),
                    onPressed: () {
                      _removeTodoItem(index);
                      Navigator.of(context).pop();
                    })
              ]);
        });
  }

  // Build the whole list of task items
  Widget _buildHome() {
    return new ListView.builder(
      itemBuilder: (context, index) {
        if (index < TaskData.tasks.length) {
          return _buildTodoItem(TaskData.tasks[index], index);
        }
        return null;
      },
    );
  }

  // Build a single todo item
  Widget _buildTodoItem(Task task, int index) {
    return new ListTile(
        leading: Icon(task.category),
        title: new Text(task.title, style: Styles.textText),
        onTap: () => _promptRemoveTodoItem(index));
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
          title: new Text('Personal Tasks', style: Styles.textTitle)),
      body: _buildHome(),
      floatingActionButton: new FloatingActionButton(
          onPressed: _pushAddTaskScreen,
          tooltip: 'Add task',
          child: new Icon(Icons.add)),
    );
  }

  void _pushAddTaskScreen() {
    Navigator.of(context)
        .push(new MaterialPageRoute(builder: (context) => new CreateTask()));
  }
}
