import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_application_1/pages/main_page.dart';
import 'package:flutter_application_1/pages/roughLogin.dart';
import 'package:flutter_application_1/utils/routes.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'main_page.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String name = "";
  bool changeButton = false;
  final _formKey = GlobalKey<FormState>();

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
                            prefixIcon: Padding(
                              padding: EdgeInsets.all(10.0),
                              child: Icon(
                                Icons.mail,
                                color: Colors.black,
                              ),
                            ),
                            labelText: 'Username',
                          ),
                          onSaved: (value) {
                            emailTextEditingController.text = value!;
                          },
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
                            onSaved: (value) {
                              passwordTextEditingController.text = value!;
                            },
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
                              primary: Colors.blueAccent[700],
                              onPrimary: Colors.white,
                              minimumSize: Size(200, 45),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15.0),
                              )),
                          icon: FaIcon(FontAwesomeIcons.lock),
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              _formKey.currentState!.save();
                              _signIn();
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

  //Firebase Authentication from Email Id and Password

  bool accountExistinDatabase = false;

  TextEditingController emailTextEditingController = TextEditingController();
  TextEditingController passwordTextEditingController = TextEditingController();

  CollectionReference users = FirebaseFirestore.instance.collection('users');
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  void _signIn() async {
    try {
      final User? newUser = (await _firebaseAuth
              .signInWithEmailAndPassword(
                  email: emailTextEditingController.text,
                  password: passwordTextEditingController.text)
              .catchError((errMsg) {
        displayToastMessage("Error: " + errMsg.toString(), context);
      }))
          .user;

      if (newUser != null)
      //checking in database for user imformation so data cant be overlapped.
      {
        final user = FirebaseAuth.instance.currentUser;
        final userId = user!.uid;

        /*Firestore*/
        // String uid = _firebaseAuth.currentUser!.uid.toString();
        // users.add({'uid': uid});
        // users.add({'email': emailTextEditingController});

        var userData = {
          'uid': user.uid,
          'provider': 'email',
          'photoUrl': user.photoURL,
          'email': emailTextEditingController.text,
        };

        users.doc(userId).get().then(
          (doc) {
            if (doc.exists) {
              // old user
              doc.reference.update(userData);

              Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (context) => MainPage(),
                ),
              );
              displayToastMessage("Login Successful", context);
            } else {
              // new user
              users.doc(user.uid).set(userData);

              Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (context) => MainPage(),
                ),
              );
            }
          },
        );
      }
    } catch (e) {
      print(e);
      print("Sign in not successful !");
      // better show an alert here
    }
  }
}
