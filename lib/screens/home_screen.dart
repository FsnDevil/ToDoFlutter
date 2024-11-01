import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_using_cubit/cubit/add_to_do_item_cubit.dart';
import 'package:todo_using_cubit/models/todo_model.dart';
import 'package:todo_using_cubit/screens/add_todo_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ToDo Application'),
      ),
      body: SafeArea(
        child: BlocBuilder<AddToDoItemCubit, AddToDoItemState>(
          builder: (context, cubitState) {
            return ListView.builder(
              itemCount: cubitState.list.length,
              // Replace with your actual item count
              itemBuilder: (context, index) {
                final todo = cubitState.list[index];
                return ListTile(
                  title: Text(todo.title),
                  trailing: GestureDetector(
                    onTap: () {
                      print('clicked');
                      BlocProvider.of<AddToDoItemCubit>(context)
                          .deleteItem(todo);
                    },
                    child: const Icon(Icons.delete),
                  ),
                );
              },
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => const AddTodoScreen()));
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
