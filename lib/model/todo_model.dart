
import 'package:cloud_firestore/cloud_firestore.dart';

class todoModel {
  String? docID;
  final String titleTask;
  final String description;
  final String timeTask;
  final String dateTask;
  final String category;
    final bool isDone;
  todoModel({
    this.docID,
    required this.titleTask,
     required this.description, 
     required this.timeTask, 
     required this.dateTask,
      required this.category,
      required this.isDone
      });

  Map<String, dynamic> toMap() {
    return {
      'docID': docID,
      'titleTask': titleTask,
      'description': description,
      'timeTask': timeTask,
      'dateTask': dateTask,
      'category': category,
      'isDone': isDone,
    };
  }

  factory todoModel.fromMap(Map<String, dynamic> map) {
    return todoModel(
      docID: map['docID'],
      titleTask: map['titleTask'] ?? '',
      description: map['description'] ?? '',
      timeTask: map['timeTask'] ?? '',
      dateTask: map['dateTask'] ?? '',
      category: map['category'] ?? '',
      isDone: map['isDone'] ?? false,
    );
  }
  factory todoModel.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> doc) {
    return todoModel(
        docID: doc.id,
        titleTask: doc['titleTask'],
        description: doc['description'],
        category: doc['category'],
        dateTask: doc['dateTask'],
        timeTask: doc['timeTask'],
        isDone: doc['isDone'],
        );
        
  }


 /* String toJson() => json.encode(toMap());

  factory todoModel.fromJson(String source) => todoModel.fromMap(json.decode(source));*/
}
