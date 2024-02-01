import 'package:assignment3/user_information.dart';
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
      body:  Column(crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
        Container( margin: EdgeInsets.only(top: 19,bottom: 7,right: 9,left: 9), padding: EdgeInsets.symmetric(vertical: 6,horizontal: 12),
          decoration: BoxDecoration(color: Colors.white,
          borderRadius:  BorderRadius.all(Radius.circular(27),) ,),
        child: Row(
          children: [
            SizedBox(width: 170,child: TextField(focusNode:focusNode ,controller: nameController,decoration: InputDecoration(hintText: hintText1,hintStyle:
            TextStyle(color: Colors.black, fontSize: 17,fontWeight: FontWeight.w600),border: InputBorder.none),)
            ),
          Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.end, children: [Icon(Icons.edit,color: Color(0xff3594DF)),]))

        ],),),
          Container( margin: EdgeInsets.symmetric(vertical: 18,horizontal: 9), padding: EdgeInsets.symmetric(vertical: 6,horizontal: 12),
            decoration: BoxDecoration(color: Colors.white,
              borderRadius:  BorderRadius.all(Radius.circular(27),) ,),
            child: Row(
              children: [
                SizedBox( width:180,
                  child: TextField(
                    focusNode: focusNode2,
                    controller: phoneController,
                      style: TextStyle(color: Colors.black,fontSize: 17),
                      decoration: InputDecoration(hintText: hintText2,hintStyle: TextStyle(color: Colors.black,fontWeight: FontWeight.w600),
                        labelStyle: TextStyle(color: Color(0xFFAAB9DA)),
                        border: InputBorder.none,

                      )
                  ),
                ),

                Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.end, children: [Icon(Icons.call,color: Color(0xff3594DF)),]))

              ],),),
          Container(
            margin: EdgeInsets.only(top: 2,bottom: 6,left: 9,right: 12),
            child: Row(mainAxisAlignment:MainAxisAlignment.spaceEvenly,children: [
            Expanded(
              flex: 1,
              child: Container(margin: EdgeInsets.all(5),child: ElevatedButton(onPressed: () {
                onAddClickListener();
              },child: Text("Add",style: TextStyle(fontWeight: FontWeight.w500),),
                style: ElevatedButton.styleFrom( // ElevatedButton styles
                  padding: EdgeInsets.fromLTRB(20, 10, 20, 10), // Some padding example
                  shape: RoundedRectangleBorder( // Border
                    borderRadius: BorderRadius.circular(18.0),
                  ),
                  textStyle: TextStyle( // Text styles
                    color: Colors.black,
                    fontSize: 18,
                    overflow: TextOverflow.ellipsis,
                  ),)

          ),),
            ),
              Expanded(flex: 1,
                child: Container(margin: EdgeInsets.all(5),child: ElevatedButton(onPressed: () {
                  onDeleteClickListener();
                },child: Text("Delete",style: TextStyle(color: Colors.black,fontWeight:FontWeight.w500 ),),
    style: ElevatedButton.styleFrom( // ElevatedButton styles
                      primary: Colors.red,
                      padding: EdgeInsets.fromLTRB(20, 10, 20, 10), // Some padding example
                      shape: RoundedRectangleBorder( // Border
                        borderRadius: BorderRadius.circular(18.0),
                        side: BorderSide(color: Colors.red),
                      ),
                  textStyle: TextStyle( // Text styles
                      color: Colors.black,
                      fontSize: 18,
                      overflow: TextOverflow.ellipsis,
                  ),)

                ),),
              ),

            ],),),
          Visibility(visible:isVisible1,
            child: Container( margin: EdgeInsets.symmetric(vertical: 15, horizontal: 9),padding: EdgeInsets.all(20),decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.all( Radius.circular(30))),child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,children: [
              Text("name: $name1",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500),),
              Text("Phone $phoneNum1",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500)),
            ],),),
          ),
          Visibility(visible:isVisible2,
            child: Container( margin: EdgeInsets.symmetric(vertical: 4, horizontal: 9),padding: EdgeInsets.all(20),decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.all( Radius.circular(30))),child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,children: [
              Text("name: $name2",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500),),
              Text("Phone : $phoneNum2",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500)),
            ],),),
          ),
          Visibility(visible:isVisible3,
            child: Container( margin: EdgeInsets.symmetric(vertical: 16, horizontal: 9),padding: EdgeInsets.all(20),decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.all( Radius.circular(30))),child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,children: [
              Text("name: $name3",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500),),
              Text("Phone : $phoneNum3",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500)),
            ],),),
          )
      ],)),
    );
  }
  @override
  void initState() {
    // TODO: implement initState
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

  void onAddClickListener(){
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

  void onDeleteClickListener(){
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

