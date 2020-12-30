import 'package:flutter/material.dart';
import 'package:task_app/classes/category.dart';
import 'package:task_app/classes/category_data.dart';
import 'package:task_app/classes/styles.dart';
import 'package:task_app/classes/task.dart';
import 'package:task_app/classes/task_data.dart';
import 'package:task_app/pages/home.dart';

class CreateTask extends StatefulWidget {
  CreateTask({Key key}) : super(key: key);

  @override
  _CreateTaskState createState() => _CreateTaskState();
}

class _CreateTaskState extends State<CreateTask> {
  String valueTitle;
  IconData valueIcon;

  void _addTaskItem(String title, IconData category) {
    if (title.length > 0) {
      // Putting our code inside "setState" tells the app that our state has changed, and
      // it will automatically re-render the list
      super.setState(
          () => TaskData.tasks.add(new Task(title: title, category: category)));
    }
    Navigator.of(context).pop(MaterialPageRoute(builder: (context) => Home()));
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
            title: new Text('Create a new task', style: Styles.textTitle)),
        body: Material(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [addText(), addCategory(), submitButton()],
            ),
          ),
        ));
  }

  Widget addText() {
    return TextField(
      style: Styles.textText,
      onSubmitted: (val) {
        valueTitle = val;

        return valueTitle;
      },
      autofocus: true,
      decoration: new InputDecoration(
          hintStyle: Styles.textText,
          hintText: 'Enter something to do...',
          contentPadding: const EdgeInsets.all(16.0)),
    );
  }

  Widget addCategory() {
    return DropdownButtonFormField<Category>(
      onChanged: (val) {
        valueIcon = val.iconCategory;
        return valueIcon;
      },
      items: CategoryData.items
          .map<DropdownMenuItem<Category>>(
            (e) => DropdownMenuItem<Category>(
              value: e,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.fromLTRB(16, 0, 0, 0),
                    child: Icon(e.iconCategory),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(16, 0, 0, 0),
                    child: Text(
                      e.categoryName,
                      style: Styles.textText,
                    ),
                  )
                ],
              ),
            ),
          )
          .toList(),
    );
  }

  Widget submitButton() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: ElevatedButton(
        onPressed: () {
          if (valueTitle == null) {
            showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: Text(
                      'Please enter some text and sumbit',
                      style: Styles.textText,
                      textAlign: TextAlign.center,
                    ),
                  );
                });
          } else if (valueTitle.length <= 0) {
            showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: Text(
                      'Please senter some text and submit',
                      style: Styles.textText,
                      textAlign: TextAlign.center,
                    ),
                  );
                });
          } else {
            _addTaskItem(valueTitle, valueIcon);
          }
        },
        child: Text(
          'Create',
          style: Styles.textLowerTitle,
        ),
      ),
    );
  }
}
