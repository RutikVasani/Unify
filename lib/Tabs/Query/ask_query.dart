// ignore_for_file: non_constant_identifier_names, unused_local_variable

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/utils/routes.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AskQuery extends StatefulWidget {
  const AskQuery({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _AskQueryState();
}

class _AskQueryState extends State<AskQuery> {
  String name = "";
  bool changeButton = false;

  final _formKey2 = GlobalKey<FormState>();
  moveToQuerySubmit(BuildContext context) async {
    if (_formKey2.currentState!.validate()) {
      setState(() {
        changeButton = true;
      });
      await Future.delayed(Duration(seconds: 1));
      await Navigator.pushNamed(context, MyRoutes.querySubmittedroutes);
      setState(() {
        changeButton = false;
      });
    }
  }

  static const menuItems = <String>[
    'DEPSTAR',
    'CSPIT',
    'CMPICA',
    'PDPICA',
    'CIPS',
  ];

  static const departmenT = <String>[
    'CSE',
    'IT',
    'CE',
  ];

  final List<DropdownMenuItem<String>> _dropDownMenuItems1 = menuItems
      .map(
        (String value) => DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        ),
      )
      .toList();

  final List<DropdownMenuItem<String>> dropdown2 = departmenT
      .map(
        (String value) => DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        ),
      )
      .toList();

  String? _btn2SelectedVal;
  String? _btn3SelectedVal;

  String? _name;
  String? _id;
  String? _phoneNumber;
  String? title;
  String? description;
  String? email;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.cyanAccent[100],
      appBar: appBar(),
      body: Padding(
        padding: const EdgeInsets.all(13.0),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16.0),
            color: Colors.white,
          ),
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(vertical: 10.0),
            child: Form(
              key: _formKey2,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
                    child: Column(
                      children: [
                        const SizedBox(height: 24.0),
                        nameE(),
                        const SizedBox(height: 24.0),
                        // "Phone number" form.
                        phone(),
                        const SizedBox(height: 24.0),
                        // "Name" form.
                        idD(),
                        const SizedBox(height: 24.0),
                        emailL(),
                        const SizedBox(height: 24.0),
                        instituteE(),
                        SizedBox(
                          height: 30,
                        ),
                        departmentT(),
                        SizedBox(
                          height: 30,
                        ),
                      ],
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 125),
                    child: Image.asset("assets/images/downarrow.gif",
                        height: 70, fit: BoxFit.fill),
                  ),

                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 10.0, horizontal: 5.0),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16.0),
                        color: Colors.orange[100],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Column(
                          children: [
                            titleE(),
                            noteDescription(context),
                          ],
                        ),
                      ),
                    ),
                  ),
                  //
                  SizedBox(
                    height: 20,
                  ),

                  submit_info_Create_Query(context),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  AppBar appBar() {
    return AppBar(
      title: Text(
        "Ask your Query",
        style: TextStyle(fontSize: 23, color: Colors.white),
      ),
      // backgroundColor: Colors.blue,
      flexibleSpace: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
          Colors.indigo.shade800,
          Colors.blue.shade500,
        ], begin: Alignment.bottomRight, end: Alignment.topLeft)),
      ),
    );
  }

  ListTile departmentT() {
    return ListTile(
      title: const Text('Department :'),
      trailing: DropdownButton(
        value: _btn3SelectedVal,
        hint: const Text('Choose'),
        onChanged: (String? newValue) {
          if (newValue != null) {
            setState(() => _btn3SelectedVal = newValue);
          }
        },
        items: dropdown2,
      ),
    );
  }

  ListTile instituteE() {
    return ListTile(
      title: const Text('Institute :'),
      trailing: DropdownButton(
        value: _btn2SelectedVal,
        hint: const Text('Choose'),
        onChanged: (String? newValue) {
          if (newValue != null) {
            setState(() => _btn2SelectedVal = newValue);
          }
        },
        items: _dropDownMenuItems1,
      ),
    );
  }

  TextFormField idD() {
    return TextFormField(
        textCapitalization: TextCapitalization.words,
        decoration: const InputDecoration(
          border: OutlineInputBorder(),
          errorBorder:
              OutlineInputBorder(borderSide: BorderSide(color: Colors.red)),
          filled: true,
          icon: Icon(Icons.contacts),
          hintText: 'Eg. 20DCS005, 20DIT051, etc.',
          labelText: 'Student ID *',
        ),
        onSaved: (String? value) {
          this._id = value;
          print('ID=$_id');
        },
        validator: (value) {
          if (value!.isEmpty) {
            return "ID cannot be empty";
          }
          return null;
        });
  }

  TextFormField nameE() {
    return TextFormField(
        textCapitalization: TextCapitalization.words,
        decoration: const InputDecoration(
          border: OutlineInputBorder(),
          errorBorder:
              OutlineInputBorder(borderSide: BorderSide(color: Colors.red)),
          filled: true,
          icon: Icon(Icons.person),
          hintText: 'What do people call you?',
          labelText: 'Name *',
        ),
        onSaved: (String? value) {
          this._name = value;
          print('name=$_name');
        },
        validator: (value) {
          if (value!.isEmpty) {
            return "Name cannot be empty";
          }
          return null;
        });
  }

  TextFormField emailL() {
    return TextFormField(
      textCapitalization: TextCapitalization.words,
      decoration: const InputDecoration(
        border: OutlineInputBorder(),
        errorBorder:
            OutlineInputBorder(borderSide: BorderSide(color: Colors.red)),
        filled: true,
        icon: Icon(Icons.mail_outline),
        labelText: 'Email *',
      ),
      onSaved: (String? value) {
        this._name = value;
        print('email=$email');
      },
      validator: (input) => input!.isValidEmail() ? null : "Check your email",
    );
  }

  TextFormField phone() {
    return TextFormField(
        decoration: const InputDecoration(
          border: OutlineInputBorder(),
          errorBorder:
              OutlineInputBorder(borderSide: BorderSide(color: Colors.red)),
          filled: true,
          icon: Icon(Icons.phone),
          hintText: ' Enter your Mobile No.',
          labelText: 'Phone Number *',
          prefixText: '+91',
        ),
        keyboardType: TextInputType.phone,
        onSaved: (String? value) {
          this._phoneNumber = value;
          print('phoneNumber=$_phoneNumber');
        },
        // TextInputFormatters are applied in sequence.
        inputFormatters: <TextInputFormatter>[
          FilteringTextInputFormatter.digitsOnly
        ],
        validator: (value) {
          if (value!.isEmpty) {
            return "Phone Number cannot be empty";
          } else if (value.length < 10) {
            return "Must have 10 digits";
          } else if (value.length > 10) {
            return "Must have 10 digits";
          }
          return null;
        });
  }

  Container submit_info_Create_Query(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40.0),
        child: ElevatedButton.icon(
          style: ElevatedButton.styleFrom(
              minimumSize: Size(150, 45),
              primary: Colors.orange[900],
              onPrimary: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25.0),
              )),
          icon: FaIcon(
            FontAwesomeIcons.arrowAltCircleRight,
          ),
          onPressed: () {
            if (_formKey2.currentState!.validate()) {
              _formKey2.currentState!.save();
              add();
              Navigator.pushNamed(context, MyRoutes.querySubmittedroutes);
            }
          },
          label: const Text(
            'Submit Query',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }

  TextFormField titleE() {
    return TextFormField(
        decoration: InputDecoration.collapsed(
          hintText: "Query Title",
        ),
        initialValue: "Query Title",
        style: TextStyle(
          fontSize: 32.0,
          fontFamily: "lato",
          fontWeight: FontWeight.bold,
          color: Colors.black87,
        ),
        onChanged: (_val) {
          title = _val;
        },
        validator: (value) {
          if (value!.isEmpty) {
            return "Query Title cannot be empty";
          }
          return null;
        });
  }

  Container noteDescription(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.75,
      padding: const EdgeInsets.only(top: 12.0),
      child: TextFormField(
        decoration: InputDecoration.collapsed(
          hintText: "Query Description",
        ),
        style: TextStyle(
          fontSize: 20.0,
          fontFamily: "lato",
          color: Colors.grey[800],
        ),
        onChanged: (_val) {
          description = _val;
        },
        validator: (value) {
          if (value!.isEmpty) {
            return "Please provide some description";
          }
          return null;
        },
        maxLines: 20,
      ),
    );
  }

/*SAVING TO DATABASE*/
  void add() async {
    CollectionReference ref = FirebaseFirestore.instance
        .collection('users')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .collection("queries");

    var data = {
      'name': _name,
      'studentId': _id,
      'phone': _phoneNumber,
      'institute': _btn2SelectedVal,
      'department': _btn3SelectedVal,
      'title': title,
      'description': description,
      'created': DateTime.now(),
    };

    ref.add(data);

    Navigator.pop(context);
  }
}

extension EmailValidator on String {
  bool isValidEmail() {
    return RegExp(
            r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
        .hasMatch(this);
  }
}
