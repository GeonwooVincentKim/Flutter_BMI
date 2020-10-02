import 'package:flutter/material.dart';
import 'package:flutter_bmi/app_screens/Body.dart';


class TodoListPage extends StatefulWidget{
  @override
  _TodoListPageState createState() => _TodoListPageState();
}

class _TodoListPageState extends State<TodoListPage>{
  final _items = <Todo>[];
  var _todoController = TextEditingController();

  @override
  void Dispose(){
    _todoController.dispose();
    super.dispose();
  }

  Widget _buildItemWidget(Todo todo){
    return ListTile(
      onTap: (){},
      title: Text(
        todo.title,
        style: todo.isDone
          ? TextStyle(
          decoration: TextDecoration.lineThrough,
          fontStyle: FontStyle.italic,
        ) : null,
      )
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("To do list"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Expanded(
                  child: TextField(
                    controller: _todoController,
                  ),
                ),
                RaisedButton(
                  child: Text("Add"),
                  onPressed: () => _addTodo(Todo(_todoController.text)),
                ),
              ],
            ),
            Expanded(
              child: ListView(
                children: _items.map((todo) => _buildItemWidget(todo)).toList(),
              ),
            )
          ]
        )
      ),
    );
  }

  void _addTodo(Todo todo){
    setState((){
      _items.add(todo);
      _todoController.text = '';
    });
  }

  void _deleteTodo(Todo todo){
    setState((){
      _items.remove(todo);
    });
  }

  void _toggleTodo(Todo todo){
    setState((){
      todo.isDone = !todo.isDone;
    });
  }
}
