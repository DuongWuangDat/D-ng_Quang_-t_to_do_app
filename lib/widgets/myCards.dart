import 'package:flutter/gestures.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';

import 'package:intl/intl.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class myCard extends StatefulWidget {
  String name;
  bool done = false;
  Function(BuildContext)? deleteTask;
  VoidCallback updateTask;
  DateTime? date;
  myCard({
    super.key,
    required this.name,
    required this.done,
    required this.deleteTask,
    this.date,
    required this.updateTask,
  }) {
    date ??= DateTime.now();
  }

  @override
  State<myCard> createState() => _myCardState();
}

class _myCardState extends State<myCard> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onLongPress: widget.updateTask,
      child: Padding(
        padding: const EdgeInsets.only(
          left: 25,
          right: 25,
          top: 25,
        ),
        child: Slidable(
          child: Container(
            height: 80,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.white,
                border: Border.all(color: Colors.black, width: 2)),
            child: Center(
              child: ListTile(
                  leading: Checkbox(
                    onChanged: (value) {
                      setState(() {
                        widget.done = !widget.done;
                      });
                    },
                    value: widget.done,
                    activeColor: Colors.black,
                  ),
                  title: Text(
                    widget.name,
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        decoration: widget.done
                            ? TextDecoration.lineThrough
                            : TextDecoration.none),
                  ),
                  trailing: Text(
                      DateFormat('kk:mm').format(widget.date!).toString())),
            ),
          ),
          endActionPane: ActionPane(motion: ScrollMotion(), children: [
            SlidableAction(
              onPressed: widget.deleteTask,
              icon: Icons.delete,
            ),
          ]),
        ),
      ),
    );
  }
}
