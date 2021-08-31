import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/utils/routes.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String name = "";
  bool changeButton = false;

  final _formKey = GlobalKey<FormState>();
  moveToHome(BuildContext context) async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        changeButton = true;
      });
      await Future.delayed(Duration(seconds: 1));
      await Navigator.pushNamed(context, MyRoutes.mainpageroutes);
      setState(() {
        changeButton = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Container(child: Image.asset("assets/images/login.gif")),
              Center(
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(40),
                        bottomRight: Radius.circular(40)),
                    boxShadow: [
                      //BoxShadow
                      BoxShadow(
                        color: Colors.blue.shade200,
                        offset: const Offset(0.0, 5.0),
                        blurRadius: 10.0,
                        spreadRadius: 3.0,
                      ), //BoxShadow
                    ],
                  ),
                  width: 200,
                  height: 70,
                  child: Center(
                    child: Text(
                      "Welcome",
                      style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 100,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 32),
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.grey.withOpacity(0.3),
                      borderRadius: BorderRadius.circular(20)),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 15.0, horizontal: 32.0),
                    child: Column(
                      children: [
                        TextFormField(
                          decoration: InputDecoration(
                            hintText: "Enter Username",
                            labelText: "Username",
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Username cannot be empty";
                            }
                            return null;
                          },
                          onChanged: (value) {
                            name = value;
                            setState(() {});
                          },
                        ),
                        TextFormField(
                            obscureText: true,
                            decoration: InputDecoration(
                              hintText: "Enter Password",
                              labelText: "Password",
                            ),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Password cannot be empty";
                              } else if (value.length < 8) {
                                return "Password must have 8 characters";
                              }
                              return null;
                            }),
                        SizedBox(
                          height: 30,
                        ),
                        TextButton(
                          child: Text(
                            "Forgot Password?",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          onPressed: () => Navigator.pushNamed(
                              context, MyRoutes.forgotroutes),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: [
                                  Colors.blue.shade800,
                                  Colors.blue.shade300,
                                  Colors.blue.shade800,
                                ],
                                begin: FractionalOffset.centerLeft,
                                end: FractionalOffset.centerRight,
                              ),
                              borderRadius:
                                  BorderRadius.circular(changeButton ? 50 : 8)),
                          child: Material(
                            color: Colors.white.withOpacity(0),
                            // borderRadius:
                            // BorderRadius.circular(changeButton ? 50 : 8),
                            child: InkWell(
                              onTap: () => moveToHome(context),
                              child: AnimatedContainer(
                                duration: Duration(seconds: 1),
                                height: 50,
                                width: changeButton ? 50 : 180,
                                alignment: Alignment.center,
                                child: changeButton
                                    ? Icon(
                                        Icons.done,
                                        color: Colors.white,
                                      )
                                    : Text("Login",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 18,
                                            color: Colors.white)),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 152,
              ),
              Container(
                // height: 60,
                child: Center(
                    child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 110),
                  child: Row(
                    children: [
                      Text(
                        "Team VSR ",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "x ",
                        style: TextStyle(color: Colors.black, fontSize: 20),
                      ),
                      Text(
                        "2021 ",
                        style: TextStyle(color: Colors.blue, fontSize: 20),
                      ),
                    ],
                  ),
                )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
