// ignore_for_file: prefer_const_constructors


import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todoapp/view/home.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    //options: DefaultFirebaseOptions.currentPlatform,
);
/*final firebaseinitializerProvider = FutureProvider<todoApp>((ref) async {
  return await Firebase.initializeApp();
});*/

  runApp(
    ProviderScope(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(),
        title: 'todoapp',
        home:  MyApp(),
      ),
    )
  );
}

