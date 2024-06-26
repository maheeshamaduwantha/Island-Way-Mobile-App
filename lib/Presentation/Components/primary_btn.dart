import 'package:flutter/material.dart';

import '../Declarations/Constants/constants.dart';

class PrimaryBtn extends StatelessWidget {
  const PrimaryBtn({super.key, required this.btnText, required this.btnFun});
  final String btnText;
  final Function btnFun;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => btnFun(),
      style: getBtnStyle(context),
      child: Text(btnText),
    );
  }

  getBtnStyle(context) => ElevatedButton.styleFrom(
      shape: RoundedRectangleBorder(borderRadius: kBorderRadius / 2),
      backgroundColor: primaryColor,
      fixedSize: Size(MediaQuery.of(context).size.width - 40, 50),
      textStyle: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18));
}
