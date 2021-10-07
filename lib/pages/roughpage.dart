import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/main.dart';
import 'package:flutter_application_1/utils/routes.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class RoughPage extends StatefulWidget {
  @override
  _RoughPageState createState() => _RoughPageState();
}

class _RoughPageState extends State<RoughPage> {
  String name = "";
  bool changeButton = false;
  final _formKey = GlobalKey<FormState>();

  TextEditingController emailTextEditingController = TextEditingController();
  TextEditingController passwordTextEditingController = TextEditingController();

  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  void registerNewUser(BuildContext context) async {
    final User? firebaseUser = (await _firebaseAuth
            .createUserWithEmailAndPassword(
                email: emailTextEditingController.text,
                password: passwordTextEditingController.text)
            .catchError((errMsg) {
      displayToastMessage("Error: " + errMsg.toString(), context);
    }))
        .user;

    if (firebaseUser != null) //usercreated
    {
      Map userDataMap = {
        "email": emailTextEditingController.text.trim(),
      };
      userRef.child(firebaseUser.uid).set(userDataMap);
      displayToastMessage(
          "Congratulations, you are successfull logged in", context);

      Navigator.pushNamed(context, MyRoutes.mainpageroutes);
    } else {
      displayToastMessage("User has not been created.",
          context); //error occured - display error
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
                          controller: emailTextEditingController,
                          decoration: InputDecoration(
                            prefixIcon: Padding(
                              padding: EdgeInsets.all(10.0),
                              child: Icon(
                                Icons.mail,
                                color: Colors.black,
                              ),
                            ),
                            labelText: 'Username',
                          ),
                          // onSaved: (value) {
                          //   txtemail = value!;
                          // },
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
                            controller: passwordTextEditingController,
                            decoration: InputDecoration(
                              prefixIcon: Padding(
                                padding: EdgeInsets.all(10.0),
                                child: Icon(
                                  Icons.lock,
                                  color: Colors.black,
                                ),
                              ),
                              labelText: 'Password',
                            ),
                            // onSaved: (value) {
                            //   txtpassword = value!;
                            // },
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Password cannot be empty";
                              } else if (value.length < 8) {
                                return "Password must have atleast 8 characters";
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
                        ElevatedButton.icon(
                          style: ElevatedButton.styleFrom(
                              primary: Colors.indigo[400],
                              onPrimary: Colors.white,
                              minimumSize: Size(200, 45),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              )),
                          icon: FaIcon(FontAwesomeIcons.lock),
                          onPressed: () {
                            if (passwordTextEditingController.text.length < 8) {
                              displayToastMessage(
                                  "Password must contain 8 characters",
                                  context);
                            } else if (!emailTextEditingController.text
                                .contains("@")) {
                              displayToastMessage(
                                  "Email address is not valid", context);
                            } else {
                              registerNewUser(context);
                            }
                          },
                          label: const Text(
                            'Login',
                            style: TextStyle(fontSize: 16),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 152,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Team VSR x",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "2021",
                    style: TextStyle(color: Colors.blue, fontSize: 15),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              )
            ],
          ),
        ),
      ),
    );
  }

  
}

displayToastMessage(String message, BuildContext context) {
  Fluttertoast.showToast(msg: message);
}

String? validateEmail(String? email) {
  if (email!.isEmpty) {
    return 'Enter email address';
  } else {
    return null;
  }
}

String? validatePassword(String? password) {
  if (password!.isEmpty) {
    return 'Enter email address';
  } else {
    return null;
  }
}
