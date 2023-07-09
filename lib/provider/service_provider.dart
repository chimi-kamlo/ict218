
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todoapp/model/todo_model.dart';

import '../services/todo_service.dart';

final serviceProvider = StateProvider<TodoService>((ref) {
  return TodoService();
});

final fetchStreamProvider = StreamProvider<List<todoModel>>((ref) async*{
  final getData = FirebaseFirestore.instance
  .collection("todoApp")
  .snapshots()
  .map((event) => event.docs.map((snapshot)=>todoModel.fromSnapshot(snapshot)).toList());
  yield*getData;
});