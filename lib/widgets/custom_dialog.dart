import 'package:flutter/material.dart';
import '../constants.dart';

void customDialog(
  BuildContext context, {
  required String title,
  required String content,
  VoidCallback? onConfirm,  
}) {
  AlertDialog alertDialog = AlertDialog(
    title: Text(title),
    content: Text(content),
    actions: <Widget>[
      ElevatedButton(
        onPressed: () {
          Navigator.of(context).pop();
          if (onConfirm != null) {
            onConfirm();  
          }
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: BG_PRIMARY,
          foregroundColor: Colors.white,
        ),
        child: Text('Okay'),
      ),
    ],
  );

  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alertDialog;
    },
  );
}
