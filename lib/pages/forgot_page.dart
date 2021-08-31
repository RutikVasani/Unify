import 'package:flutter/material.dart';

class ForgotPassword extends StatelessWidget {
  const ForgotPassword({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Center(child: Text("Forgot password page", style: TextStyle(color: Colors.black, fontSize: 30),)),
    );
  }
}