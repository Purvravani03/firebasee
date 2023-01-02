import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebasee/view.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    //options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MaterialApp(
    home: GLogin(),
  ));
}
class GLogin extends StatefulWidget {
  const GLogin({Key? key}) : super(key: key);

  @override
  State<GLogin> createState() => _GLoginState();
}

class _GLoginState extends State<GLogin> {
  Future<UserCredential> signInWithGoogle() async {
    // Trigger the authentication flow
          final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    // Once signed in, return the UserCredential
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("google login"),),
      body: ElevatedButton(onPressed: () {
        signInWithGoogle().then((value) => {
          print(value),
        });
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return second23();
        },));

      }, child: Text("google login")),

    );
  }
}
