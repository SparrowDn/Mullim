import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:mullim/pages/LoadingPage.dart';

class SigninPage extends StatefulWidget {
  const SigninPage({Key? key}) : super(key: key);

  @override
  State<SigninPage> createState() => _SigninPageState();
}

class _SigninPageState extends State<SigninPage> {
  TextEditingController _IDSignincontroller = TextEditingController();
  TextEditingController _PWSignincontroller = TextEditingController();
  final IDformKeySignin = GlobalKey<FormState>();
  final PWformKeySignin = GlobalKey<FormState>();



  void _register() async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
              email: _IDSignincontroller.text,
              password: _PWSignincontroller.text);
    } on FirebaseAuthException catch (e){
      print(e);
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("${e.message}")));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 120),
          child: Center(
            child: Column(
              children: [
                Image.asset("lib/assets/images/logoexample.png"),
                SizedBox(height: 40),

                //아이디 입력 칸
                Form(
                  key: IDformKeySignin,
                  child: TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "아이디를 입력하세요";
                      }
                      return null;
                    },
                    controller: _IDSignincontroller,
                    decoration: InputDecoration(
                      hintText: "아이디를 입력하세요",
                      labelText: "ID",
                    ),
                  ),
                ),

                //PW 입력칸
                Form(
                  key: PWformKeySignin,
                  child: TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "비밀번호를 입력하세요";
                      }
                      return null;
                    },
                    controller: _PWSignincontroller,
                    decoration: InputDecoration(
                      hintText: "비밀번호를 입력하세요",
                      labelText: "PW",
                    ),
                  ),
                ),

                // 회원가입 버튼
                ElevatedButton(
                  onPressed: () {
                    _register();
                  },
                  child: Text("회원가입"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
