import 'package:flutter/material.dart';

showLoaderDialog(BuildContext context) {
  // AlertDialog alert = AlertDialog(
  //   backgroundColor: Colors.transparent,
  //   content: Column(
  //     mainAxisAlignment: MainAxisAlignment.center,
  //     mainAxisSize: MainAxisSize.min,
  //     children: const <Widget>[
  //       SizedBox(
  //         width: 48,
  //         height: 48,
  //         child: CircularProgressIndicator(),
  //       ),
  //     ],
  //   ),
  // );

  showDialog(
    barrierDismissible: false,
    context: context,
    builder: (BuildContext context) =>
        Center(child: CircularProgressIndicator()),
  );
}
