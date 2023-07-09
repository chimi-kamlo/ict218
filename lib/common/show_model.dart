
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';
import 'package:todoapp/model/todo_model.dart';
import 'package:todoapp/provider/radio_provider.dart';
import '../constants/app_style.dart';
import '../provider/date_time_provider.dart';
import '../provider/service_provider.dart';
import '../widget/date_time_widget.dart';
import '../widget/radio_widget.dart';
import '../widget/textfield_widget.dart';

class AddNewTaskModel extends ConsumerWidget {
   AddNewTaskModel({
    super.key,
  });
 final titleController = TextEditingController();
 final descriptionController = TextEditingController();
  @override
  Widget build(BuildContext context, WidgetRef ref) {
   final dateProv = ref.watch(dateProvider);
    return Container(
      padding: const EdgeInsets.all(30),
      height:MediaQuery.of(context).size.height*0.80,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child:     Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
        const SizedBox(
          width: double.infinity,
          child: Text("new task todo",
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 22,fontWeight:FontWeight.bold,color: Colors.black ),
          )),
        const Divider(
          thickness: 1.2,
         color:Color.fromARGB(255, 63, 61, 61),
        ),
        const Gap(12),
        const Text("title task",
         style:AppStyle.headingOne
        ),
       const Gap(6),
         TextFieldWidget( maxLine: 1, hintText:"add task name", txtController: titleController, ),
        const Gap(12),
       const Text("description", style:AppStyle.headingOne ,),
        const Gap(6),
        TextFieldWidget(maxLine: 3, hintText:"add description", txtController: descriptionController, ),
       const Gap(12),
       const Text("categories", style:AppStyle.headingOne ,),
       const Gap(12),
          Row(
        children:[
           Expanded(
            child: RadioWidget(categColor: Colors.green,titleRadio: "Learning",

             valueInput: 1,
             onChandeValue: () => ref.read(radioProvider.notifier).update((state) => 1),
          )),

           Expanded(child: RadioWidget(categColor: Colors.blue,titleRadio: "Worcking", 

            valueInput: 2,
            onChandeValue: () => ref.read(radioProvider.notifier).update((state) => 2),
            )),
          
           Expanded(child: RadioWidget(categColor: Colors.red,titleRadio: "general", 

            valueInput: 3,
            onChandeValue: () => ref.read(radioProvider.notifier).update((state) => 3),
            )),
        
        ],
       ),

       //date and time
        Row(
       mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          DateTimeWidget(titleText: 'Date', 
          valueText: dateProv,
           iconSection: CupertinoIcons.calendar,
           onTap: () async {
            final getValue =await showDatePicker(context: context, 
            initialDate:DateTime.now() ,
           firstDate: DateTime(2021), lastDate: DateTime(2025));
           if(getValue!=null){
            final format = DateFormat.yMd();
          
          ref
          .read( dateProvider.notifier)
          .update((state)=>format.format(getValue));
           }
           },
           
           ),
       const Gap(22),
          DateTimeWidget(titleText:'Time',
           valueText:ref.watch(timeProvider) , 
           iconSection: CupertinoIcons.clock,
          onTap: () async{
           final getTime = await showTimePicker(
            context: context, 
            initialTime: TimeOfDay.now());
            if(getTime!=null){
            //final format = DateFormat.yMd();
          
          ref
          .read( timeProvider.notifier)
          .update((state)=> getTime.format(context));
           }

          },
          )
        ],
       ),

       //buttom section
         const Gap(12),
       Row(
        children: [
          Expanded(child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white,
              foregroundColor: Colors.blue.shade800,
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              side: BorderSide(
                color: Colors.blue.shade800,
              ),
              padding: const EdgeInsets.symmetric(vertical: 14),
            ),
            child: const Text("cancel"),
          onPressed:() => Navigator.pop(context),
          )),
         const Gap(20),
           Expanded(child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue.shade800,
              foregroundColor: Colors.white,
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
             
              padding: const EdgeInsets.symmetric(vertical: 14),
            ),
            child: const Text("create"),
          onPressed:() {

            final getRadioValue = ref.read(radioProvider);

            String category ='';

            switch(getRadioValue){
              case 1:
              category="learning";
              break;
              case 2:
              category ="working";
              break;
              case 3:
              category="general";
            }

            ref.read(serviceProvider).addNewTask(
              todoModel(titleTask: titleController.text,
               description: descriptionController.text, 
               timeTask: ref.read(timeProvider),
                dateTask: ref.read(dateProvider),
                 category: category ,
                 isDone:false,
                 ),
                 
            );
            print("la tache a bien ete");

            titleController.clear();
            descriptionController.clear();
            ref.read(radioProvider.notifier).update((state) => 0);
            Navigator.pop(context);
          },
          )),

        ],
       )
      ]),
    );
  }
}

