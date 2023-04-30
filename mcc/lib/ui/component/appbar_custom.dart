import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mcc/ui/views/home/home_view.dart';

class AppBarCustom{
  static AppBar appBarBackButton(BuildContext context, String? title, {List<Widget>? actions}) {
    return AppBar(
      backgroundColor: Colors.orange[400],
      elevation: 0,
      leading: InkWell(
        onTap: () => Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => const HomeView())),
        child: Icon(
          Icons.chevron_left,
          color: Colors.white,
        ),
      ),
      title: Text(
        title ?? '',
        style: TextStyle(
            fontWeight: FontWeight.w600
        ),
        textAlign: TextAlign.center,
      ),
      actions: actions == null ? <Widget>[] : actions,
    );
  }
}
