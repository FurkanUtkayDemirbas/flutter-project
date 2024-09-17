import 'package:flutter/material.dart';
import 'package:todo_app/constants/tasktype.dart';
import 'package:todo_app/model/task.dart';
import 'package:todo_app/model/todo.dart';

class Todoitem extends StatefulWidget {
  const Todoitem({
    super.key,
    required this.task,
  });

  final Todo task;

  @override
  State<Todoitem> createState() => _TodoitemState();
}

class _TodoitemState extends State<Todoitem> {
  bool ischecked = false;
  @override
  Widget build(BuildContext context) {
    return Card(
      color: widget.task.completed! ? Colors.grey : Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            /*  widget.task.type == Tasktype.note
                ? Image.asset("lib/assets/image/Category.png")
                : widget.task.type == Tasktype.contest
                    ? Image.asset("lib/assets/image/Category3.png")
                    : Image.asset("lib/assets/image/Category2.png"),*/
            Image.asset("lib/assets/image/Category.png"),
            Expanded(
              child: Column(
                children: [
                  Text(
                    widget.task.todo!,
                    style: TextStyle(
                      decoration: widget.task.completed!
                          ? TextDecoration.lineThrough
                          : TextDecoration.none,
                      fontWeight: FontWeight.bold,
                      fontSize: 21,
                    ),
                  ),
                  Text(
                    "user : ${widget.task.userid!}",
                  ),
                ],
              ),
            ),
            Checkbox(
                value: ischecked,
                onChanged: (val) => {
                      setState(
                        () {
                          widget.task.completed = !widget.task.completed!;
                          ischecked = val!;
                        },
                      )
                    }),
          ],
        ),
      ),
    );
  }
}
