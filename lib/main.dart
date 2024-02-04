import 'package:assignment3/addedcontact.dart';
import 'package:assignment3/btnwidget.dart';
import 'package:assignment3/user_information.dart';
import 'package:assignment3/userinputdetails_widget.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  List<UserInformation> UsersList=[];
  var isVisible1=false;
  var name1="Unkown";
  var phoneNum1="Umkown";

  var isVisible2=false;
  var name2="Unkown";
  var phoneNum2="Unkown";

  var isVisible3=false;
  var name3="Unkown";
  var phoneNum3="Unkown";
  FocusNode focusNode = FocusNode();
  FocusNode focusNode2 = FocusNode();

  String hintText1='Enter your name here';
  String hintText2="Enter Your phone Here";


  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Contacts Screen",
      home: Scaffold(backgroundColor: Color(0xff9E9E9E),
          appBar: AppBar(title: Text("Contacts Screen"),centerTitle: true,),
      body:  SingleChildScrollView(child: Column(crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          UserInputDetailsWidget(hintText1: hintText1, focusNode: focusNode, nameController: nameController),
          UserInputDetailsWidget(hintText1: hintText2, focusNode: focusNode2, nameController: phoneController),
          Container(
            margin: EdgeInsets.only(top: 2,bottom: 6,left: 9,right: 12),
            child: Row(mainAxisAlignment:MainAxisAlignment.spaceEvenly,children: [
              CustomBtn(btnBackgrounColor:Colors.blueAccent , BtnText: "Add", OnBtnClickListener: OnAddClickListener , btnTextColor: Colors.white),
              CustomBtn(btnBackgrounColor: Colors.red, BtnText: "Delete", OnBtnClickListener: OnDeleteClickListener,btnTextColor: Colors.black,)
            ],),),
          AddedContact(isVisible: isVisible1, name: name1, phoneNum: phoneNum1),
          AddedContact(isVisible: isVisible2, name: name2, phoneNum: phoneNum2),
          AddedContact(isVisible: isVisible3, name: name3, phoneNum: phoneNum3),

        ],),)),
    );
  }
  @override
  void initState() {
    super.initState();
    focusNode.addListener(() {
      if(focusNode.hasFocus){
        hintText1="";
      }else{
        hintText1="Enter your name here";
      }
      setState(() {

      });
    });
    focusNode2.addListener(() {
      if(focusNode2.hasFocus){
        hintText2='';
      }else{
        hintText2="Enter Your phone Here";
      }
      setState(() {

      });
    });
  }

  void OnAddClickListener(){
    setState(() {

      if(UsersList.isEmpty && nameController.text !="" && phoneController.text !=""){
        name1=nameController.text;
        phoneNum1=phoneController.text;
        isVisible1=true;
        UsersList.add(UserInformation(name: name1, phoneNum: phoneNum1,visability: isVisible1));
        print("name: ${UsersList[0].name}, phoneNum ${UsersList[0].phoneNum}, visability ${UsersList[0].visability} ,${UsersList.length}");
      }else if(UsersList.length==1 && nameController.text !="" && phoneController.text !=""){
        name2=nameController.text;
        phoneNum2=phoneController.text;
        isVisible2=true;
        UsersList.add(UserInformation(name: name2, phoneNum: phoneNum2,visability: isVisible2));
        print("name: ${UsersList[1].name}, phoneNum ${UsersList[1].phoneNum}, visability ${UsersList[1].visability} ,${UsersList.length}");
      }else if(UsersList.length==2 && nameController.text !="" && phoneController.text !=""){
        name3=nameController.text;
        phoneNum3=phoneController.text;
        isVisible3=true;
        UsersList.add(UserInformation(name: name3, phoneNum: phoneNum3,visability: isVisible3));
        print("name: ${UsersList[2].name}, phoneNum ${UsersList[2].phoneNum}, visability ${UsersList[2].visability} ,${UsersList.length}");
      }
      nameController.clear();
      phoneController.clear();
    });
  }

  void OnDeleteClickListener(){
    setState(() {
      if(UsersList.length==1){
        name1='';
        phoneNum1='';
        isVisible1=false;
      }
      else if(UsersList.length==2){
        name2='';
        phoneNum2='';
        isVisible2=false;
      }
      else if(UsersList.length==3){
        name3='';
        phoneNum3='';
        isVisible3=false;
      }

      UsersList.removeAt(UsersList.length-1);



    });
  }


}

