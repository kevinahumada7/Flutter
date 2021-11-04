import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

alert(BuildContext context, String titulo, String content) {
  if (!kIsWeb && Platform.isIOS) {
    showCupertinoDialog(
      context: context,
      builder: ( _ ) => CupertinoAlertDialog(
        title: Text(titulo),
        content: Text(content),
        actions: [
            CupertinoDialogAction(
              isDefaultAction: true,
              child: Text('Ok'),
              onPressed: ()=> Navigator.pop(context)
            )
        ],
      )
    );
  } else {
    showDialog(
      context: context,
      builder: ( _ ) => AlertDialog(
        title: Text(titulo),
        content: Text(content),
        titleTextStyle: TextStyle(color: Colors.blue, fontSize: 24),
        actions: [
          MaterialButton(
            child: Text('Ok'),
            elevation: 5,
            textColor: Colors.blue,
            onPressed: ()=> Navigator.pop(context)
          )
        ],
      )
    );
  }
}
