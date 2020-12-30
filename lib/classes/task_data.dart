import 'package:task_app/classes/task.dart';

class TaskData extends Task {
  static final List<Task> tasks = [Task(title: 'Buying christmas presents')];

  static Task fetchAny() {
    return TaskData.tasks[0];
  }

  static List<Task> fetchAll() {
    return TaskData.tasks;
  }
}
