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
      appBar: AppBar(title: Text('Google Sign In')), // 구글 로그인
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

                // 로그인 후 메인 화면으로 이동
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => HomeScreen(displayName: user.displayName!),
                  ),
                );
              }
            } catch (e) {
              print(e);
            }
          },
          child: Text('google log in'),
        ),
      ),
    );
  }
}

class HomeScreen extends StatefulWidget {
  final String displayName;

  HomeScreen({required this.displayName});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _textController = TextEditingController();

  void _saveToDatabase() async {
    final user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      DatabaseReference ref = FirebaseDatabase.instance.ref("users").child(user.uid).child("entries");
      await ref.push().set({
        "text": _textController.text,
        "timestamp": DateTime.now().toIso8601String(),
      });
      print('Text saved to Firebase: ${_textController.text}');
      _textController.clear(); // 텍스트 필드 비우기
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Welcome ${widget.displayName}!')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _textController,
              decoration: InputDecoration(labelText: 'Enter your text here'),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: _saveToDatabase,
              child: Text('Save to Database!'),
            ),
          ],
        ),
      ),
    );
  }
}
