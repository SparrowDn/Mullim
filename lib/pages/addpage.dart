import 'package:flutter/material.dart';

class addpage extends StatefulWidget {
  const addpage({Key? key}) : super(key: key);

  @override
  State<addpage> createState() => _addpageState();
}

class _addpageState extends State<addpage> {
  TextEditingController titlecontroller = TextEditingController();

  List<String> classlist = ["1", "2", "3", "4"];
  String _selectedvalue = "1";

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
              style: TextStyle(color: Colors.orange, fontWeight: FontWeight.bold, fontSize: 17),
            ),
            onTap: (){print(Text("hi"));},
          ),
        )
      ],
    );
  }

  //바디
  _bodywidget() {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
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
            SizedBox(height: 0),
            Container(
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.all(20),
              child: Container(
                child: TextFormField(
                  controller: titlecontroller,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    hintText: '희망  가격',
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
