import 'package:flutter/material.dart';
import 'package:getx_test_1/task/edit_screen/edit_task_controller.dart';
import 'package:getx_test_1/text_style.dart';

class EditTaskScreen extends StatefulWidget {
  const EditTaskScreen({Key? key}) : super(key: key);

  static String id = '/edit_task';
  static GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  State<EditTaskScreen> createState() => _EditTaskScreenState();
}

class _EditTaskScreenState extends State<EditTaskScreen> {
  EditTaskController editTaskController = EditTaskController();

  @override
  void initState() {
    editTaskController.initialize();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Task Task'),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Form(
              key: EditTaskScreen.formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Edit Task',
                    style: kHeadLine1TextStyle(color: Colors.black),
                  ),
                  TaskInputField(
                    title: 'Title',
                    hint: null,
                    controller: editTaskController.titleController,
                    validator: editTaskController.titleValidator,
                    maxLines: 1,
                  ),
                  TaskInputField(
                    title: 'Note',
                    hint: null,
                    controller: editTaskController.taskController,
                    validator: editTaskController.noteValidator,
                    maxLines: 7,
                  ),
                  const SizedBox(height: 8.0),
                  Text(editTaskController.date),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 20.0),
                        child: Column(
                          children: const [
                            SizedBox(width: 100.0),
                          ],
                        ),
                      ),
                      const SizedBox(width: 60),
                      Expanded(
                        child: TextButton(
                          onPressed: () {
                            editTaskController.editTasks();
                          },
                          style: TextButton.styleFrom(
                              foregroundColor: Colors.white,
                              backgroundColor: Colors.blue),
                          child: const Text('Edit Task'),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
