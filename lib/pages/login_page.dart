import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter_application_1/utils/routes.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'main_page.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String name = "";
  bool changeButton = false;
  final _formKey = GlobalKey<FormState>();

  late String txtemail, txtpassword;

  // ignore: non_constant_identifier_names
  final DatabaseReference user =
      FirebaseDatabase.instance.reference().child("users");
  final databaseRef = FirebaseDatabase.instance.reference();
  final _auth = FirebaseAuth.instance;

  void _signIn() async {
    try {
      final newUser = await _auth.signInWithEmailAndPassword(
          email: txtemail, password: txtpassword);

      // ignore: unnecessary_null_comparison
      if (newUser != null) {
        final user = FirebaseAuth.instance.currentUser;
        final userId = user!.uid;

        _addUsers(userId);

        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => MainPage()));
      } else {
        print('fail');
      }
    } catch (e) {
      print(e);
    }
  }

  // ignore: non_constant_identifier_names
  void _addUsers(String Id) {
    databaseRef.push().set({
      'name': txtemail,
    });
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
                            txtemail = value!;
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
                              txtpassword = value!;
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
                              primary: Colors.indigo[400],
                              onPrimary: Colors.white,
                              minimumSize: Size(200, 45),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),
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
