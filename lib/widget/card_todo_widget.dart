import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';

import '../provider/service_provider.dart';

class cardTodoListWidget extends ConsumerWidget {
  const cardTodoListWidget({
    super.key, required this.getIdex,
  });
   final int getIdex;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    
    final todoData = ref.watch(fetchStreamProvider);
    return todoData.when(
      data:(todoData)  {
        
        Color categoryColor=Colors.white;
      final getCategory = todoData[getIdex].category;
      switch(getCategory){

        case 'learning':
        categoryColor = Colors.green;
        break;

        case 'working':
        categoryColor = Colors.blue.shade700;
        break;
            
        case 'general':
        categoryColor = Colors.amber.shade700;
        break;



      }
    return Container(
      margin:const  EdgeInsets.symmetric(vertical: 4),
      width: double.infinity,
      height: 130,
      decoration:BoxDecoration(color: Colors.white,
      borderRadius: BorderRadius.circular(12),
      ),
      child: Row(children: [
        Container(
          decoration: BoxDecoration(
            color: categoryColor,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(12),
              bottomLeft: Radius.circular(12),
            )
          ),
          width: 30,
        ),
        Expanded(
          child: Padding(padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children:  [
            ListTile(
              contentPadding: EdgeInsets.zero,
              leading: IconButton(icon: const Icon(CupertinoIcons.delete),

              onPressed:()=> ref.read(serviceProvider).delecteTask(todoData[getIdex].docID),
              
              ),
              title: Text(todoData[getIdex].titleTask,maxLines: 1,
               style: TextStyle(
                decoration: todoData[getIdex].isDone ?TextDecoration.lineThrough:null
               ),
              ),
              subtitle: Text(todoData[getIdex].description,maxLines: 1,
                 style: TextStyle(
                decoration: todoData[getIdex].isDone ?TextDecoration.lineThrough:null
              )),
              trailing:Transform.scale(
                scale: 1.5,
                child: Checkbox(
                  activeColor:  Colors.blue.shade800,
                  shape: const CircleBorder(),
                  value: todoData[getIdex].isDone, 
                  onChanged: (value)=>ref.read(serviceProvider).updateTask(todoData[getIdex].docID, value))),
            ),
           Transform.translate(
            offset: const Offset(0,-12),
             child: Container(
              child: Column(children: [
                Divider(thickness: 1.5,
             color: Colors.grey.shade100,),
           
             Row(
              children: [
                const Text("today"),
                 const Gap(12),
                Text(todoData[getIdex].timeTask),
              ],
             )
              ],),
             ),
           )
          ]),
          ),
          
        
        )
      ],),
    );
      },
      
    error: (error,StackTrace)=>Center(
      child: Text(StackTrace.toString()),
    ),
    
     loading: ()=> const Center(
     child: CircularProgressIndicator()
    )
    
    );
  }
}

