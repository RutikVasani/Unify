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

  final List<DropdownMenuItem<String>> _dropDownMenuItems = menuItems
      .map(
        (String value) => DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        ),
      )
      .toList();

  String? _btn2SelectedVal;

  String? _name;
  String? _id;
  String? _phoneNumber;
  String? title;
  String? description;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Form(
          key: _formKey2,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              const SizedBox(height: 24.0),
              // "Name" form.
              TextFormField(
                  textCapitalization: TextCapitalization.words,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    errorBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.red)),
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
                  }),
              const SizedBox(height: 24.0),
              // "Phone number" form.
              TextFormField(
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    errorBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.red)),
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
                  }),
              const SizedBox(height: 24.0),
              // "Name" form.
              TextFormField(
                  textCapitalization: TextCapitalization.words,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    errorBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.red)),
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
                  }),
              const SizedBox(height: 24.0),
              ListTile(
                title: const Text('Depratment :'),
                trailing: DropdownButton(
                  value: _btn2SelectedVal,
                  hint: const Text('Choose'),
                  onChanged: (String? newValue) {
                    if (newValue != null) {
                      setState(() => _btn2SelectedVal = newValue);
                    }
                  },
                  items: _dropDownMenuItems,
                ),
              ),
              Divider(
                color: Colors.grey,
                height: 30,
                thickness: 5,
                indent: 0,
                endIndent: 0,
              ),
              const SizedBox(height: 24.0),
              TextFormField(
                decoration: InputDecoration.collapsed(
                  hintText: "Query Title",
                ),
                style: TextStyle(
                  fontSize: 32.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey[900],
                ),
                onChanged: (_val) {
                  title = _val;
                },
              ),
              Divider(
                color: Colors.black,
                height: 30,
                thickness: 1,
                indent: 1,
                endIndent: 5,
              ),
              const SizedBox(height: 5.0),
              // "Life story" form.
              TextFormField(
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Write your Query\n\n\n\n',
                  helperText: 'Please ask in understandable way.',
                  labelText: 'Ask Your Query / Doubts',
                ),
                style: TextStyle(
                  fontSize: 20.0,
                ),
                onChanged: (_val) {
                  description = _val;
                },
                maxLines: null,
              ),
              const SizedBox(height: 24.0),
              // "Password" form.
              Container(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40.0),
                  child: ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                        minimumSize: Size(150, 45),
                        primary: Colors.blueAccent[700],
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
                        Navigator.pushNamed(
                            context, MyRoutes.querySubmittedroutes);
                      }
                    },
                    label: const Text(
                      'Submit Query',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
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
      'name       ': _name,
      'studentId  ': _id,
      'department ': _btn2SelectedVal,
      'title': title,
      'description': description,
      'created': DateTime.now(),
    };

    ref.add(data);

    Navigator.pop(context);
  }
}
