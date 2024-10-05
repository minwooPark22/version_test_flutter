import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:google_sign_in/google_sign_in.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(); // Firebase 초기화
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Memory Plant',
      home: SignInScreen(),
    );
  }
}

class SignInScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Google Sign In로그인!')),    //구글 로그인
      body: Center(
        child: ElevatedButton(
          onPressed: () async {
            try {
              final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
              final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;
              final credential = GoogleAuthProvider.credential(
                accessToken: googleAuth?.accessToken,
                idToken: googleAuth?.idToken,
              );
              final UserCredential userCredential = await FirebaseAuth.instance.signInWithCredential(credential);
              final user = userCredential.user;

              if (user != null) {
                // Firebase Realtime Database에 사용자 UID 저장
                DatabaseReference ref = FirebaseDatabase.instance.ref("users").child(user.uid);
                await ref.set({
                  "uid": user.uid,
                  "email": user.email,
                  "displayName": user.displayName,
                });
                print('User saved to Firebase: ${user.displayName}');
              }
            } catch (e) {
              print(e);
            }
          },
          child: Text('Sign In with Google'),
        ),
      ),
    );
  }
}
