import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:mullim/utils/crud.dart';

import 'choicepage.dart';

class addpage extends StatefulWidget {
  const addpage({Key? key}) : super(key: key);

  @override
  State<addpage> createState() => _addpageState();

}




class _addpageState extends State<addpage> {
  TextEditingController titlecontroller = TextEditingController();
  TextEditingController pricecontroller = TextEditingController();
  String dropdownvalue = '전자과';
  var items = [
    '전자과',
    '연기과',
    '무용과',
    '자동차과',
    '항공정비과',
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appbarwidget(),
      body: _bodywidget(),
    );
  }



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
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return '필수 항목입니다';
                  }
                },
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
                      controller: pricecontroller,
                      keyboardType: TextInputType.number,
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return '필수 항목입니다';
                        }
                      },
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
              child:
              DropdownButton(

                hint: Text("과를 선택하세요!"),

                // Initial Value
                value: dropdownvalue,

                // Down Arrow Icon
                icon: const Icon(Icons.keyboard_arrow_down),

                // Array list of items
                items: items.map((String items) {
                  return DropdownMenuItem(
                    value: items,
                    child: Text(items),
                  );
                }).toList(),
                // After selecting the desired option,it will
                // change button value to selected value
                onChanged: (String? newValue) {
                  setState(() {
                    dropdownvalue = newValue!;
                  });
                },
              ),
            ),

          ],
        ),
      ),
    );
  }


}
