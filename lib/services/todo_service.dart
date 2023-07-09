
import 'package:cloud_firestore/cloud_firestore.dart';

import '../model/todo_model.dart';

class TodoService{
  final todoCollection = FirebaseFirestore.instance.collection('todoApp');
 //crud
  void  addNewTask(todoModel model) {
    todoCollection.add(model.toMap());
  }

  //update
  void updateTask(String? docId,bool? valueUpdate){

    todoCollection.doc(docId).update({
      'isDone':valueUpdate,
    });
  }
  //delecte
  void delecteTask(String? docId){
   
    todoCollection.doc(docId).delete();

  }
}




