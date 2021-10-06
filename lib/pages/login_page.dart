import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'main_page.dart';


class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  
  final _formKey = GlobalKey<FormState>();
  late String txtemail, txtpassword;

  // ignore: non_constant_identifier_names
  final DatabaseReference user = FirebaseDatabase.instance.reference().child("Users");
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
    databaseRef.push().set({'name': txtemail,});
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.blue,
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: SingleChildScrollView(
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.7,
                  height: MediaQuery.of(context).size.height * 0.4,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15)),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        SizedBox(
                          height: 30,
                        ),
                        TextFormField(
                          decoration: InputDecoration(
                            prefixIcon: Padding(
                              padding: EdgeInsets.all(10.0),
                              child: Icon(
                                Icons.mail,
                                color: Colors.black,
                              ),
                            ),
                            labelText: 'username',
                          ),
                          onSaved: (value) {
                            txtemail = value!;
                          },
                          validator: validateEmail,
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
                            labelText: 'password',
                          ),
                          onSaved: (value) {
                            txtpassword = value!;
                          },
                          validator: validatePassword,
                        ),
                        SizedBox(
                          height: 70,
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 16),
                                child: ElevatedButton(
                                  onPressed: () {
                                    if (_formKey.currentState!.validate()) {
                                      _formKey.currentState!.save();
                                      _signIn();
                                    }
                                  },
                                  child: Text('Login'),
                                ),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    ));
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
}
