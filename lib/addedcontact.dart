
import 'package:flutter/material.dart';

class AddedContact extends StatelessWidget{
  bool isVisible;
  String name;
  String phoneNum;

  AddedContact({required this.isVisible, required this.name, required this.phoneNum});

  @override
  Widget build(BuildContext context) {

    return Visibility(visible:isVisible,
      child: Container( margin: EdgeInsets.symmetric(vertical: 15, horizontal: 9),padding: EdgeInsets.all(20),decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.all( Radius.circular(30))),child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,children: [
        Text("name: $name",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500),),
        Text("Phone $phoneNum",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500)),
      ],),),
    );
  }


}