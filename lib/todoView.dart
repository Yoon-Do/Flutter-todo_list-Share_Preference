import 'package:flutter/material.dart';
import 'package:todo/todo.dart';

class TodoView extends StatefulWidget {
  Todo todo;
  TodoView({Key key, this.todo}) : super(key: key);

  @override
  _TodoViewState createState() => _TodoViewState(todo: this.todo);
}

class _TodoViewState extends State<TodoView> {
  Todo todo;
  _TodoViewState({this.todo});
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  String priority = "First";
  String dropdownValue = 'First';

  @override
  void initState() {
    super.initState();
    if (todo != null) {
      titleController.text = todo.title;
      descriptionController.text = todo.description;
      todo.priority ?? "Low";
    }
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        elevation: 10,
        backgroundColor: Colors.blue,
        title: Text("Todo View"),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              Container(
                  child: colorOverride(TextField(
                onChanged: (data) {
                  todo.title = data;
                },
                style: TextStyle(color: Colors.black87),
                decoration: new InputDecoration(
                  labelStyle: TextStyle(color: Colors.black87),
                  labelText: "Title",
                  fillColor: Colors.black87,
                  border: new OutlineInputBorder(
                    borderRadius: new BorderRadius.circular(25.0),
                    borderSide: new BorderSide(color: Colors.black87),
                  ),
                  //fillColor: Colors.green
                ),
                controller: titleController,
              ))),
              SizedBox(
                height: 25,
              ),
              Container(
                  child: colorOverride(TextField(
                maxLines: 5,
                onChanged: (data) {
                  todo.description = data;
                },
                style: TextStyle(color: Colors.black87),
                decoration: new InputDecoration(
                  labelStyle: TextStyle(color: Colors.black87),
                  labelText: "Description",
                  fillColor: Colors.black87,
                  border: new OutlineInputBorder(
                    borderRadius: new BorderRadius.circular(25.0),
                    borderSide: new BorderSide(color: Colors.black87),
                  ),
                  //fillColor: Colors.green
                ),
                controller: descriptionController,
              ))),
              SizedBox(
                height: 25,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  DropdownButton<String>(
                    value:  todo.priority,
                    onChanged: (String newValue) {
                      setState(() {
                        todo.priority = newValue;
                      });
                    },
                    items: <String>['Low', 'High']
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                  Spacer(),
                  FlatButton(
                    onPressed: () {
                      setState(() {
                        todo.status = !todo.status;
                      });
                    },
                    child: Text("Task is done?"),
                    color: todo.status ? Colors.green : Colors.red,
                  ),

                ],
              )
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pop(context, todo);
        },
        child: Icon(Icons.save),
      ),


    );
  }

  Widget colorOverride(Widget child) {
    return new Theme(
      data: new ThemeData(
        primaryColor: Colors.white,
        accentColor: Colors.white,
        hintColor: Colors.white,
      ),
      child: child,
    );
  }
}
