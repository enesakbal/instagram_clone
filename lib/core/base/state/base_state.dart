import 'package:flutter/material.dart';

abstract class BaseState<T extends StatefulWidget> extends State<T> {
  ThemeData get themeData => Theme.of(context);

  double dynamicHeight(double value) =>
      MediaQuery.of(context).size.height * value;

  double dynamicWidth(double value) =>
      MediaQuery.of(context).size.width * value;

  double get appBarMinusBody =>
      MediaQuery.of(context).size.height -
      AppBar().preferredSize.height -
      MediaQuery.of(context).padding.top;

  double get appBarMinusBody2x =>
      MediaQuery.of(context).size.height -
      2 * AppBar().preferredSize.height -
      MediaQuery.of(context).padding.top;

  double get appBarMinusBody3x =>
      MediaQuery.of(context).size.height -
      3 * AppBar().preferredSize.height -
      MediaQuery.of(context).padding.top;
}
