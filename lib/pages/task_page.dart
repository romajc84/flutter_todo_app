import 'package:flutter/material.dart';

class TaskPage extends StatefulWidget {
  @override
  _TaskPageState createState() => _TaskPageState();
}

class Task {
  final String task;
  final bool isFinish;
  const Task(this.task, this.isFinish);
}

final List<Task> _taskList = [
  Task('Call Tom about appointment', false),
  Task('Fix on boarding experience', false),
  Task('Edit API documentation', false),
  Task('Set up user focus group.', false),
  Task('Have coffee with Sam', true),
  Task('Meet with Sales.', true),
];

class _TaskPageState extends State<TaskPage> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(0),
      itemCount: _taskList.length,
      itemBuilder: (context, index) {
        return _taskList[index].isFinish
            ? _taskComplete(_taskList[index].task)
            : _taskUncomplete(_taskList[index].task);
      },
    );
  }

  Widget _taskUncomplete(String task) {
    return Padding(
      padding: const EdgeInsets.only(left: 20.0, bottom: 24.0),
      child: Row(
        children: [
          Icon(
            Icons.radio_button_unchecked,
            color: Theme.of(context).accentColor,
            size: 20,
          ),
          SizedBox(
            width: 28,
          ),
          Text(task),
        ],
      ),
    );
  }

  Widget _taskComplete(String task) {
    return Container(
      foregroundDecoration: BoxDecoration(color: Color(0x60FDFDFD)),
      child: Padding(
        padding: const EdgeInsets.only(left: 20.0, top: 24.0),
        child: Row(
          children: [
            Icon(
              Icons.radio_button_checked,
              color: Theme.of(context).accentColor,
              size: 20,
            ),
            SizedBox(
              width: 28,
            ),
            Text(task),
          ],
        ),
      ),
    );
  }
}
