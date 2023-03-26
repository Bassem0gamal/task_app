import 'package:flutter/material.dart';
import 'package:getx_test_1/icons.dart';
import 'package:getx_test_1/task/models/task_input_field_model.dart';
import 'package:getx_test_1/task/task_controller.dart';
import 'package:getx_test_1/text_style.dart';
import 'package:intl/intl.dart';

class AddTaskScreen extends StatefulWidget {
  const AddTaskScreen({Key? key}) : super(key: key);
  static String id = '/add_task_screen';

  @override
  State<AddTaskScreen> createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  TaskController taskController = TaskController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('New Task'),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Add Task',
                  style: kHeadLine1TextStyle(color: Colors.black),
                ),
                TaskInputField(
                  title: 'Title',
                  hint: 'Enter title here',
                  controller: taskController.title,
                ),
                TaskInputField(
                  title: 'Note',
                  hint: 'Enter note here',
                  controller: taskController.task,
                ),
                TaskInputField(
                  title: 'Date',
                  hint: DateFormat.yMEd().format(DateTime.now()),
                  controller: taskController.date,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text('Color'),
                          Padding(
                            padding: const EdgeInsets.only(top: 8),
                            child: Row(
                              children: [
                                blueCircleIcon(),
                                redCircleIcon(),
                                yellowCircleIcon(),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 60),
                    Expanded(
                      child: TextButton(
                        onPressed: () => taskController.addTask(
                            title: taskController.title.text,
                            task: taskController.task.text,
                            date: taskController.date.text,
                            time: taskController.time.text,
                            repeat: taskController.repeat.text,
                            color: null),
                        style: TextButton.styleFrom(
                            foregroundColor: Colors.white,
                            backgroundColor: Colors.blue),
                        child: const Text('Create Task'),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
