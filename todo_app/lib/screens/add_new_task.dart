import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:todo_app/constants/color.dart';
import 'package:todo_app/constants/tasktype.dart';
import 'package:todo_app/model/task.dart';

class Addnewtaskscreen extends StatefulWidget {
  const Addnewtaskscreen({super.key, required this.addnewtask});
  final void Function(Task newtask) addnewtask;
  @override
  State<Addnewtaskscreen> createState() => _AddnewtaskscreenState();
}

class _AddnewtaskscreenState extends State<Addnewtaskscreen> {
  TextEditingController titlecontroller = TextEditingController();
  TextEditingController datecontroller = TextEditingController();
  TextEditingController timecontroller = TextEditingController();
  TextEditingController descriptioncontroller = TextEditingController();

  Tasktype tasktype = Tasktype.note;

  @override
  Widget build(BuildContext context) {
    double deviceheight = MediaQuery.of(context).size.height;
    double devicewidth = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        backgroundColor: HexColor(backgroundcolor),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: devicewidth,
                height: deviceheight / 9,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("lib/assets/image/header2.png"),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Row(
                  children: [
                    DecoratedBox(
                      decoration: BoxDecoration(
                        color:
                            Colors.white, // Arka plan rengini burada ayarlayın
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: IconButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        icon: const Icon(
                          Icons.close,
                          size: 30,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    const Expanded(
                      child: Text(
                        "Add New Task",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    )
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 10),
                child: Text("Task title"),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 40,
                  vertical: 5,
                ),
                child: TextField(
                  controller: titlecontroller,
                  decoration: const InputDecoration(
                      filled: true, fillColor: Colors.white),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const Text("Category"),
                    GestureDetector(
                      onTap: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            duration: Duration(milliseconds: 300),
                            content: Text("Category selected"),
                          ),
                        );
                        setState(() {
                          tasktype = Tasktype.note;
                        });
                      },
                      child: Image.asset("lib/assets/image/Category.png"),
                    ),
                    GestureDetector(
                      onTap: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            duration: Duration(milliseconds: 300),
                            content: Text("Category selected"),
                          ),
                        );
                        setState(() {
                          tasktype = Tasktype.calendar;
                        });
                      },
                      child: Image.asset("lib/assets/image/Category2.png"),
                    ),
                    GestureDetector(
                      onTap: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            duration: Duration(milliseconds: 300),
                            content: Text("Category selected"),
                          ),
                        );
                        setState(() {
                          tasktype = Tasktype.contest;
                        });
                      },
                      child: Image.asset("lib/assets/image/Category3.png"),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        children: [
                          const Text("Date"),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 20,
                            ),
                            child: TextField(
                              controller: datecontroller,
                              decoration: const InputDecoration(
                                filled: true,
                                fillColor: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        children: [
                          const Text("Time"),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: TextField(
                              controller: timecontroller,
                              decoration: const InputDecoration(
                                filled: true,
                                fillColor: Colors.white,
                              ),
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 10),
                child: Text("Description"),
              ),
              SizedBox(
                height: 250,
                child: TextField(
                  controller: descriptioncontroller,
                  expands: true,
                  maxLines: null,
                  decoration: const InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    isDense: true,
                  ),
                ),
              ),
              ElevatedButton(
                  onPressed: () {
                    Task newtask = Task(
                      type: tasktype,
                      title: titlecontroller.text,
                      description: descriptioncontroller.text,
                      iscompleted: false,
                    );
                    widget.addnewtask(newtask);
                    Navigator.pop(context);
                  },
                  child: const Text("save"))
            ],
          ),
        ),
      ),
    );
  }
}
