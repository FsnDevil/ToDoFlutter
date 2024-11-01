import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_using_cubit/models/todo_model.dart';

class AddToDoItemCubit extends Cubit<AddToDoItemState> {
  AddToDoItemCubit() : super(AddToDoItemInitial());

  void addItem(ToDo item) {
    if (item.title.isEmpty) {
      emit(AddToDoItemError('Please enter a to-do item', state.list)); // Pass the current list to error state
      return;
    }
    final List<ToDo> list = List.from(state.list)..add(item);
    emit(AddToDoItemLoaded(list));
  }

  void deleteItem(ToDo item){
    final List<ToDo> list = List.from(state.list);
    list.remove(item);
    emit(AddToDoItemDeleted(list));
  }

  @override
  void onChange(Change<AddToDoItemState> change) {
    super.onChange(change);
    print(change);
  }
}

// Define states for your Cubit
abstract class AddToDoItemState {
  final List<ToDo> list;
  AddToDoItemState({this.list = const []});
}

class AddToDoItemInitial extends AddToDoItemState {}

class AddToDoItemLoaded extends AddToDoItemState {
  AddToDoItemLoaded(List<ToDo> list) : super(list: list);
}

class AddToDoItemDeleted extends AddToDoItemState {
  AddToDoItemDeleted(List<ToDo> list) : super(list: list);
}

class AddToDoItemError extends AddToDoItemState {
  final String error;
  AddToDoItemError(this.error, List<ToDo> list) : super(list: list); // Pass the list here
}
