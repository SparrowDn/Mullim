import 'package:flutter/material.dart';

import 'choicepage.dart';

class addpage extends StatefulWidget {
  const addpage({Key? key}) : super(key: key);

  @override
  State<addpage> createState() => _addpageState();
}

class _addpageState extends State<addpage> {
  TextEditingController titlecontroller = TextEditingController();

  List<String> classlist = ["1", "2", "3", "4"];
  String _selectedvalue = "1";

  List<String> items = ["선택하세요"];
  String? selecteditem = "선택하세요!";

  //앱바위젯
  PreferredSizeWidget _appbarwidget() {
    return AppBar(
      backgroundColor: Colors.white,
      title: Text(
        '글 쓰기',
        style: TextStyle(color: Colors.black),
      ),
      centerTitle: true,
      leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.clear,
            color: Colors.black,
          )),
      actions: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 8),
          alignment: Alignment.centerRight,
          child: GestureDetector(
            child: Text(
              "완료",
              style: TextStyle(
                  color: Colors.orange,
                  fontWeight: FontWeight.bold,
                  fontSize: 17),
            ),
            onTap: () {
              print(Text("hi"));
            },
          ),
        )
      ],
      elevation: 1,
    );
  }

  //바디
  _bodywidget() {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 20),

            //제목 입력 칸
            Container(
              //color: Colors.green,
              padding: EdgeInsets.symmetric(vertical: 0, horizontal: 20),
              child: TextFormField(
                maxLength: 20,
                controller: titlecontroller,
                decoration: InputDecoration(
                  hintText: '제목',
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.black12),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),

            //가격 입력 칸
            Container(
              //color: Colors.blue,
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.symmetric(vertical: 0, horizontal: 20),
              child: Container(
                child: Expanded(
                  child: Container(
                    child: TextFormField(
                      controller: titlecontroller,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        hintText: '희망 가격',
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.black12),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),

            //과 선택 창
            Container(
              //color: Colors.blue,
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.symmetric(vertical: 0, horizontal: 20),
              child: Container(
                child: Expanded(
                  child: Container(
                    decoration: BoxDecoration(border: Border(bottom: BorderSide(color: Colors.grey, ))),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("과를 선택하세요!", style: TextStyle(fontSize: 16),),
                        Icon(Icons.arrow_right_sharp)
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appbarwidget(),
      body: _bodywidget(),
    );
  }
}
