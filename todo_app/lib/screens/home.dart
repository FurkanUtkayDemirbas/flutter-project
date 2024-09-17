import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:todo_app/constants/color.dart';
import 'package:todo_app/constants/tasktype.dart';
import 'package:todo_app/model/task.dart';
import 'package:todo_app/screens/add_new_task.dart';
import 'package:todo_app/service/todo_service.dart';
import 'package:todo_app/todoitem.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  // List<String> todo = ["Study Lessons", "Run 5K", "Go To Party"];
  // List<String> completed = ["Game Meetup ", "Take Out Trash"];
  List<Task> todo = [
    Task(
      type: Tasktype.note,
      title: "Study Lessons",
      description: "Study COMP117",
      iscompleted: false,
    ),
    Task(
      type: Tasktype.calendar,
      title: "Go To Party",
      description: "Attend to party",
      iscompleted: false,
    ),
    Task(
      type: Tasktype.contest,
      title: "Run 5K",
      description: "Run 5 kilometers",
      iscompleted: false,
    ),
  ];

  List<Task> completed = [
    Task(
      type: Tasktype.note,
      title: "Study Lessons",
      description: "Study COMP117",
      iscompleted: false,
    ),
    Task(
      type: Tasktype.contest,
      title: "Run 5K",
      description: "Run 5 kilometers",
      iscompleted: false,
    ),
  ];

  void addNewTask(Task newtask) {
    setState(() {
      todo.add(newtask);
    });
  }

  @override
  Widget build(BuildContext context) {
    TodoService todoService = TodoService();

    double deviceheight = MediaQuery.of(context).size.height;
    double devicewidth = MediaQuery.of(context).size.width;

    return MaterialApp(
      home: SafeArea(
        child: Scaffold(
          backgroundColor: HexColor(backgroundcolor),
          body: Column(
            children: [
              //HEADER
              Container(
                width: devicewidth,
                height: deviceheight / 3,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                  image: AssetImage("lib/assets/image/header.png"),
                  fit: BoxFit.cover,
                )),
                child: const Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 20),
                      child: Text(
                        "October 20,2022",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 40),
                      child: Text(
                        "My Todo List",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 35,
                            fontWeight: FontWeight.bold),
                      ),
                    )
                  ],
                ),
              ),
              //Top column
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                  child: SingleChildScrollView(
                    child: FutureBuilder(
                      future: todoService.gettodos(),
                      builder: (context, snapshot) {
                        if (snapshot.data.isNull) {
                        } else {
                          return ListView.builder(
                            primary: false,
                            shrinkWrap: true,
                            itemCount: snapshot.data!.length,
                            itemBuilder: (context, index) {
                              return Todoitem(
                                task: snapshot.data![index],
                              );
                            },
                          );
                        }
                      },
                    ),
                  ),
                ),
              ),

              //completed text
              const Padding(
                padding: EdgeInsets.only(left: 25),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Completed",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                ),
              ),
              //bottom column

              /*
               Expanded(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                  child: SingleChildScrollView(
                    child: ListView.builder(
                      shrinkWrap: true,
                      primary: false,
                      itemCount: completed.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Todoitem(task:[index]);
                      },
                    ),
                  ),
                ),
              ),
               */

              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => Addnewtaskscreen(
                      addnewtask: (newtask) => addNewTask(newtask),
                    ),
                  ));
                },
                child: const Text("Add New Task"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
