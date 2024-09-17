class Todo {
  Todo({
    required this.id,
    required this.todo,
    required this.completed,
    required this.userid,
  });

  int? id;
  String? todo;
  bool? completed;
  int? userid;
  //from json
  Todo.fromjson(Map<String, dynamic> json) {
    id = json["id"];
    todo = json["todo"];
    completed = json["completed"];
    userid = json["userid"];
  }

  //to json
  Map<String, dynamic> tojson() {
    final Map<String, dynamic> data = {};
    data["id"] = id;
    data["todo"] = todo;
    data["completed"] = completed;
    data["userid"] = userid;
    return data;
  }
}
