import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'GLogin.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      //options: DefaultFirebaseOptions.currentPlatform,
      );
  runApp(MaterialApp(
    home: GLogin(),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  CollectionReference users = FirebaseFirestore.instance.collection('users');
  TextEditingController t1 = TextEditingController();
  TextEditingController t2 = TextEditingController();

  Future<void> addUser() {
    // Call the user's CollectionReference to add a new user
    return users
        .add({
          'name': "${t1.text}", // John Doe
          'contact': "${t2.text}", // Stokes and Sons
        // 42
        })
        .then((value) => print("User Added"))
        .catchError((error) => print("Failed to add user: $error"));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    //   appBar: AppBar(title: Text("contact_book"),),
    //     body: Column(
    //       children: [
    //         Container(
    //
    //   child: TextField(
    //           controller: t1,
    //           decoration:
    //               InputDecoration(hintText: "ENTER NAME", labelText: "ENTER NAME")),
    // ),
    //         Container(
    //   child: TextField(
    //           controller: t2,
    //           decoration:
    //               InputDecoration(hintText: "ENTER contact", labelText: "ENTER contact")),
    // ),
    //         ElevatedButton(onPressed: () {
    //         addUser();
    //         }, child: Text("submit")),
    //         ElevatedButton(onPressed: () {
    //           Navigator.push(context, MaterialPageRoute(builder: (context) {
    //             return
    //           },));
    //         }, child: Text("view data"))
    //       ],
     //  )
    );
  }
}
