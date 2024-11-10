import 'package:expense_tracker/controller/expenses.dart';
import 'package:flutter/material.dart';
import 'package:expense_tracker/view/themedata.dart';
import 'package:expense_tracker/view/dark_themedata.dart';
void main(){
  runApp(MaterialApp(
    theme: themeData,
    darkTheme: darkThemeData,
    themeMode: ThemeMode.system,
    debugShowCheckedModeBanner: false,
    home:const Expenses(),
  ),);
}