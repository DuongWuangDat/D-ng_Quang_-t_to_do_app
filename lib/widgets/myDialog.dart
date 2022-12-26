import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';

class MyDiaLog extends StatelessWidget {
  final controller;
  VoidCallback save;
  VoidCallback cancel;
  MyDiaLog({
    super.key,
    required this.controller,
    required this.save,
    required this.cancel,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.blue,
      content: Container(
          height: 120,
          child: Column(
            children: [
              //get input
              TextField(
                  controller: controller,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "Add a new task",
                  )),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ElevatedButton(onPressed: save, child: const Text("Save")),
                  ElevatedButton(onPressed: cancel, child: const Text("Cancel"))
                ],
              )
            ],
          )),
    );
  }
}
