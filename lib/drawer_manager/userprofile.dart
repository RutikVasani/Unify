import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/main.dart';
import 'package:flutter_application_1/pages/roughLogin.dart';
import 'package:flutter_application_1/utils/routes.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class UserProfile extends StatefulWidget {
  UserProfile({Key? key}) : super(key: key);

  @override
  _UserProfileState createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  String name = "";
  bool changeButton = false;

  final _formKey3 = GlobalKey<FormState>();
  moveToMainPage(BuildContext context) async {
    if (_formKey3.currentState!.validate()) {
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

  String? _name;
  String? _phoneNumber;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          "Your Profile",
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
          key: _formKey3,
          child: Column(
            children: <Widget>[
              const SizedBox(height: 24.0),
              // "Name" form.
              TextFormField(
                  controller: nameController,
                  textCapitalization: TextCapitalization.words,
                  decoration: const InputDecoration(
                    icon: Icon(Icons.person),
                    labelText: 'Enter Your Name',
                    border: OutlineInputBorder(),
                    errorBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.red)),
                  ),
                  onSaved: (String? value) {
                    this._name = value;
                    print('name=$_name');
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Name cannot be empty";
                    }
                    return null;
                  }),
              SizedBox(
                height: 15,
              ),
              TextFormField(
                  controller: phoneController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    errorBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.red)),
                    filled: true,
                    icon: Icon(Icons.phone),
                    hintText: '  Enter your Mobile No.',
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
                    if (value == null || value.isEmpty) {
                      return "Phone Number cannot be empty";
                    } else if (value.length < 10) {
                      return "Must have 10 digits";
                    } else if (value.length > 10) {
                      return "Must have 10 digits";
                    }
                    return null;
                  }),
              SizedBox(
                height: 15,
              ),
              TextFormField(
                controller: bioController,
                decoration: const InputDecoration(
                  icon: Icon(Icons.info),
                  border: OutlineInputBorder(),
                  hintText: 'Add your Bio...',
                  helperText: 'Keep it short, this is just a demo.',
                  labelText: 'Add your Bio',
                ),
                maxLines: 3,
              ),
              SizedBox(
                height: 15,
              ),
              ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                    primary: Colors.blue[600],
                    onPrimary: Colors.white,
                    minimumSize: Size(200, 45),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    )),
                icon: FaIcon(FontAwesomeIcons.upload),
                onPressed: () {
                  if (_formKey3.currentState!.validate()) {
                    _formKey3.currentState!.save();
                    _saveuserProfile();
                  }
                },
                label: Text(
                  'Update Profile',
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  //Firebase Realtime database part

  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController bioController = TextEditingController();

  void _saveuserProfile() async {
    final user = FirebaseAuth.instance.currentUser;
    final userId = user!.uid;

    saveuserProfile(userId);
    displayToastMessage("Your Profile is saved", context);
  }

  void saveuserProfile(String id) {
    userRef.push().set({
      'Name  ': nameController.text,
      'Phone ': phoneController.text,
      'Bio   ': bioController.text,
    });
  }
}
