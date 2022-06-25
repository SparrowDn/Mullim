import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mullim/login/SigninPage.dart';

import 'HomePage.dart';

class LoadingPage extends StatefulWidget {
  const LoadingPage({Key? key}) : super(key: key);

  @override
  State<LoadingPage> createState() => _LoadingPageState();
}

class _LoadingPageState extends State<LoadingPage> {
  TextEditingController namecontroller = TextEditingController();
  TextEditingController pwcontroller = TextEditingController();
  final _IDformKey = GlobalKey<FormState>();
  final _PWformKey = GlobalKey<FormState>();


  void _login() async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(
          email: namecontroller.text,
          password: pwcontroller.text);
      Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()));
    }
    catch (e) {
      print(e);
    }
  }




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 120.0, horizontal: 20.0),
          child: Center(
            child: Column(
              children: [
                Image.asset("lib/assets/images/logoexample.png"),
                Text("슬기로운 대학생활의 시작은 나눔으로부터!"),
                SizedBox(height: 40),

                // 아이디 입력 칸
                Form(
                  key: _IDformKey,
                  child: TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "아이디를 입력하세요";
                      }
                      return null;
                    },
                    controller: namecontroller,
                    decoration: InputDecoration(
                      hintText: "아이디를 입력하세요",
                      labelText: "ID",
                    ),
                  ),
                ),

                //비밀번호 입력 칸
                Form(
                  key: _PWformKey,
                  child: TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "비밀번호를 입력하세요";
                      }
                      return null;
                    },
                    obscureText: true,
                    controller: pwcontroller,
                    decoration: InputDecoration(
                      hintText: "비밀번호를 입력하세요",
                      labelText: "PW",
                    ),
                  ),
                ),

                //로그인하기 버튼, 클릭시 데이터검증 필요
                Container(
                  width: 100,
                  child: ElevatedButton(
                    onPressed: () {
                      if (_IDformKey.currentState!.validate());
                      if (_PWformKey.currentState!.validate());
                      _login();
                    },
                    child: Text("로그인하기"),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.amber
                    ),
                  ),
                ),

                //회원가입 버튼
                ElevatedButton(onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => SigninPage()));
                }, child: Text('회원가입'))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
