import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../provider/radio_provider.dart';

class RadioWidget extends ConsumerWidget {
  const RadioWidget(    {
    super.key, required this.titleRadio, required this.categColor,required this.valueInput,required this.onChandeValue, 
  });
 final String titleRadio;
 final Color categColor;
 final int valueInput;
 final VoidCallback onChandeValue ;
  @override
  Widget build(BuildContext context , WidgetRef ref) {
       // ignore: unused_local_variable
    final radio = ref.watch(radioProvider);
    return Material(

      child: Theme(
        data: ThemeData(unselectedWidgetColor: categColor),
        child: RadioListTile(
          activeColor: categColor,
          contentPadding: EdgeInsets.zero,
          title: Transform.translate(offset:const Offset(-22, 0),
          child:    Text( titleRadio ,style: TextStyle(color:categColor,fontWeight: FontWeight.w700 ),)),
           value: valueInput, 
          groupValue: radio, 
          onChanged:(value) =>onChandeValue()),
      ),
    );
  }
}

