import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:todoapp/provider/service_provider.dart';

import '../common/show_model.dart';
import '../widget/card_todo_widget.dart';

class MyApp extends ConsumerWidget {
   MyApp({super.key});
 final titleController = TextEditingController();
 final descriptionController = TextEditingController();
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context ,WidgetRef ref) {
    final todoData = ref.watch(fetchStreamProvider);
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
        title:  ListTile(
          leading: CircleAvatar(
            backgroundColor: Colors.amber.shade200,
            radius: 30,
            child: Image.asset('assets/avatar.png'),

          ),
          title: const Text("HELLO I m", style: TextStyle(fontSize: 12,),
          
        ),

       subtitle: const Text("kamlo"),
      ),
      actions: 
       [
        Padding(padding: EdgeInsets.symmetric(horizontal: 20),
        child: Row(children: [
          IconButton(
           onPressed: () {},
           icon:  Icon(CupertinoIcons.calendar),
          ),
          IconButton(
           onPressed: () {},
           icon:  Icon(CupertinoIcons.bell),
          )
        ]),
        ),
        
      ]
      ),
     body: SingleChildScrollView(
      child:Padding(padding: const EdgeInsets.symmetric(horizontal: 20),
       child: Column(children: [
        const Gap(20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children:const [
                Text('taches du jour',
                style: TextStyle(
                  fontSize:18,fontWeight: FontWeight.bold,
                  color: Colors.black ),),
                Text("mercredi", style: TextStyle(color: Colors.grey),)
                
              ],
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFD5E8FA),
                foregroundColor: Colors.blue.shade800,
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                )
              ),
              onPressed:() => showModalBottomSheet(
                isScrollControlled: true,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                context: context,
                builder: (context)=>AddNewTaskModel()
              ),
            child: Text("nouvelle tache"
            
            )),
           
          ],
        
         ),
         Gap(20),
          // task list

            ListView.builder(
              itemCount: todoData.value!.length ,
              shrinkWrap: true,
              itemBuilder:(context,index)=> 
             cardTodoListWidget(getIdex: index) ,
            )
       ]),
       ),
    )
    );
  }
}

