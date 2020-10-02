import 'package:flutter/material.dart';
import 'package:flutter_bmi/app_screens/Body.dart';


class TodoListPage extends StatefulWidget{
  @override
  _TodoListPageState createState() => _TodoListPageState();
}

class _TodoListPageState extends State<TodoListPage>{
  final _items = <Todo>[];
  final _formKey = GlobalKey<FormState>();
  var _todoController = TextEditingController();

  @override
  void Dispose(){
    _todoController.dispose();
    super.dispose();
  }

  Widget _buildItemWidget(Todo todo){
    return ListTile(
      onTap: () => _toggleTodo(todo),
      title: Text(
        todo.title,
        style: todo.isDone
          ? TextStyle(
          decoration: TextDecoration.lineThrough,
          fontStyle: FontStyle.italic,
        ) : null,
      ),
      trailing: IconButton(
        icon: Icon(Icons.delete_forever),
        onPressed: () => _deleteTodo(todo),
      ),
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
        child: Form(
          key: _formKey,
          child: Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Expanded(
                      child: TextFormField(
                          controller: _todoController,
                          keyboardType: TextInputType.number,
                          validator: (value){
                            if(value.trim().isEmpty){
                              return "Please Input your Height";
                            }
                            return null;
                          }
                      ),
                    ),
                    RaisedButton(
                      child: Text("Add"),
                      onPressed: () {
                        if(_formKey.currentState.validate()){
                          _addTodo(Todo(_todoController.text));
                        }
                      },
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
