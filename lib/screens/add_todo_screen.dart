import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_using_cubit/cubit/add_to_do_item_cubit.dart';
import 'package:todo_using_cubit/models/todo_model.dart';

class AddTodoScreen extends StatefulWidget {
  const AddTodoScreen({super.key});

  @override
  State<AddTodoScreen> createState() => _AddTodoScreenState();
}

class _AddTodoScreenState extends State<AddTodoScreen> {
  TextEditingController textEditingController = TextEditingController();
  TextEditingController textEditingControllerDesc = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocListener<AddToDoItemCubit, AddToDoItemState>(
      listener: (context, state) {
        if (state is AddToDoItemError) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.error)),
          );
        }else if(state is AddToDoItemLoaded){
          Navigator.of(context).pop();
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Add Item'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(18.0),
          child: SafeArea(
              child: Column(
            children: [
              const SizedBox(
                height: 100,
              ),
              TextField(
                controller: textEditingController,
                decoration: InputDecoration(
                    hintText: 'Enter your todo item',
                    border: OutlineInputBorder(
                        borderSide:
                            const BorderSide(width: 1, color: Colors.black),
                        borderRadius: BorderRadius.circular(10))),
              ),
              const SizedBox(height: 20,),
              TextField(
                controller: textEditingControllerDesc,
                decoration: InputDecoration(
                    hintText: 'Enter your todo item description',
                    border: OutlineInputBorder(
                        borderSide:
                        const BorderSide(width: 1, color: Colors.black),
                        borderRadius: BorderRadius.circular(10))),
              ),
              const SizedBox(
                height: 50,
              ),
              SizedBox(
                  width: double.infinity,
                  child: TextButton(
                    onPressed: () {
                      BlocProvider.of<AddToDoItemCubit>(context).addItem(ToDo(
                          title: textEditingController.text.trim(),
                          createAt: DateTime.now()));
                    },
                    style: ButtonStyle(
                      backgroundColor:
                          WidgetStateProperty.all<Color>(Colors.blue),
                    ),
                    child: const Text(
                      'Add',
                      style: TextStyle(color: Colors.white),
                    ),
                  ))
            ],
          )),
        ),
      ),
    );
  }
}
