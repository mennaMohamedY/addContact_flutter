
import 'package:flutter/material.dart';

class CustomBtn extends StatelessWidget{
  Color btnBackgrounColor;
  Color btnTextColor;
  String BtnText;
  Function OnBtnClickListener;

  CustomBtn({required this.btnBackgrounColor, required this.BtnText, required this.OnBtnClickListener, required this.btnTextColor});
  @override
  Widget build(BuildContext context) {

    return  Expanded(
      flex: 1,
      child: Container(margin: EdgeInsets.all(5),child: ElevatedButton(onPressed: () {
        //onAddClickListener();
        OnBtnClickListener();
      },child: Text(BtnText,style: TextStyle(fontWeight: FontWeight.w500,color: btnTextColor),),
          style: ElevatedButton.styleFrom( // ElevatedButton styles
            primary: btnBackgrounColor,
            padding: EdgeInsets.fromLTRB(20, 10, 20, 10), // Some padding example
            shape: RoundedRectangleBorder( // Border
              borderRadius: BorderRadius.circular(18.0),
              side: BorderSide(color: btnBackgrounColor),
            ),
            textStyle: TextStyle( // Text styles
              color: btnTextColor,
              fontSize: 18,
              overflow: TextOverflow.ellipsis,
            ),)

      ),),
    );
  }


}