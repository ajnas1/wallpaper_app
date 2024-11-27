import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wallpaper/utilities/colors.dart';
import 'package:wallpaper/viewmodel/home_view_model.dart';

Widget elevatedButtons({required String title,required int index,required int selectedIndex,required BuildContext context}) {
  return ElevatedButton(
    style: ElevatedButton.styleFrom(
       backgroundColor: index == selectedIndex? homeSelectedButtonBackgroundColor:homeUnSelectedButtonBackgroundColor
    ),
    onPressed: (){
      Provider.of<HomeViewModel>(context,listen: false).changeSelectedIndex(index);
    }, 
    child: Text(title,style: TextStyle(color: index == selectedIndex? homeSelectedButtonTextColor:homeUnSelectedButtonTextColor),),
  );
}