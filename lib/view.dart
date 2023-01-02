import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebasee/GLogin.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class second23 extends StatefulWidget {
  const second23({Key? key}) : super(key: key);

  @override
  State<second23> createState() => _second23State();
}

class _second23State extends State<second23> {
  User? user = FirebaseAuth.instance.currentUser;
  final credential = GoogleAuthProvider.credential;
  String Username = "";
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if(credential !=null){
      Username=user!.displayName.toString();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(actions: [
        IconButton(onPressed: () async {
          await GoogleSignIn().signOut();
          await FirebaseAuth.instance.signOut();
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return GLogin();
          },));

        }, icon:Icon(Icons.logout))
      ],title: Text("view email")),
      body: Text(
        "name  :  ${Username}",

        style: TextStyle(fontSize: 30),
      ),
    );
  }
}
