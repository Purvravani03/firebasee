import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class second extends StatefulWidget {
  const second(Type user, {Key? key}) : super(key: key);

  @override
  State<second> createState() => _secondState();
}

class _secondState extends State<second> {
  final Stream<QuerySnapshot> _usersStream = FirebaseFirestore.instance.collection('users').snapshots();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("view data")),
      body: StreamBuilder<QuerySnapshot>(
        stream: _usersStream,
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return Text('Something went wrong');
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return Text("Loading");
          }

          return ListView(
            children: snapshot.data!.docs.map((DocumentSnapshot document) {
              Map<String, dynamic> data = document.data()! as Map<String, dynamic>;
              return ListTile(
                title: Text(data['name']),
                subtitle: Text(data['contact']),

              );
            }).toList(),
          );
        },
      ),

    );
  }
}
