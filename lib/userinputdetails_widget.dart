

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class UserInputDetailsWidget extends StatelessWidget{

  TextEditingController nameController;
  FocusNode focusNode;
  String hintText1;
  UserInputDetailsWidget({required this.hintText1, required this.focusNode, required this.nameController});

  @override
  Widget build(BuildContext context) {

    return
      Container( margin: EdgeInsets.only(top: 19,bottom: 7,right: 9,left: 9), padding: EdgeInsets.symmetric(vertical: 6,horizontal: 12),
      decoration: BoxDecoration(color: Colors.white,
        borderRadius:  BorderRadius.all(Radius.circular(27),) ,),
      child: Row(
        children: [
          SizedBox(width: 170,child: TextField(focusNode:focusNode ,controller: nameController,decoration: InputDecoration(hintText: hintText1,hintStyle:
          TextStyle(color: Colors.black, fontSize: 17,fontWeight: FontWeight.w600),border: InputBorder.none),)
          ),
          Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.end, children: [Icon(Icons.edit,color: Color(0xff3594DF)),]))

        ],),);
  }

}