import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';

import 'package:to_do_app/widgets/myCards.dart';
import 'package:intl/intl.dart';
import 'package:to_do_app/widgets/myDialog.dart';
import 'package:flutter/src/widgets/editable_text.dart';

class homescreen extends StatefulWidget {
  @override
  State<homescreen> createState() => _homescreenState();
}

class _homescreenState extends State<homescreen> {
  List newTask = [
    ["Di ngu", false],
  ];
  final _controller = TextEditingController();
  void addTask() {
    setState(() {
      newTask.add([_controller.text, false]);
      _controller.clear();
    });
    Navigator.of(context).pop();
  }

  void createDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return MyDiaLog(
          controller: _controller,
          save: addTask,
          cancel: () {
            setState(() {
              return Navigator.of(context).pop();
            });
          },
        );
      },
    );
  }

  void createDialog2(int index) {
    showDialog(
      context: context,
      builder: (context) {
        return MyDiaLog(
          controller: _controller,
          save: () {
            setState(() {
              newTask[index][0] = _controller.text;
            });
            Navigator.of(context).pop();
          },
          cancel: () {
            setState(() {
              return Navigator.of(context).pop();
            });
          },
        );
      },
    );
  }

  void deleteFunction(int index) {
    setState(() {
      newTask.removeAt(index);
    });
  }

  void updateFunction(int index) {
    setState(() {
      createDialog2(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("To Do App"),
          actions: const [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Icon(Icons.restore),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
            onPressed: createDialog, child: const Icon(Icons.add)),
        body: ListView.builder(
          itemBuilder: (context, index) {
            return myCard(
              name: newTask[index][0],
              done: newTask[index][1],
              deleteTask: (context) => deleteFunction(index),
              updateTask: () => updateFunction(index),
            );
          },
          itemCount: newTask.length,
        ));
  }
}
