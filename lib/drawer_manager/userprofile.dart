import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/utils/routes.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';

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

  String? _btn3SelectedVal;
  String? _btn4SelectedVal;

  String? _fname;
  String? _lname;
  String? _phoneNumber;
  String? _id;

  //USER PROFILE PICTURE
  File? image;

  Future pickImage(ImageSource source) async {
    try {
      final image = await ImagePicker().pickImage(source: source);
      if (image == null) return;

      final imageTemperory = File(image.path);
      // ignore: unused_local_variable
      final imagePermanent = await saveImagePermanently(image.path);
      setState(() => this.image = imageTemperory);
    } on PlatformException catch (e) {
      print('Failed to pick image: $e');
    }
  }

  Future<File> saveImagePermanently(String imagePath) async {
    final directory = await getApplicationDocumentsDirectory();
    final name = basename(imagePath);
    final image = File('${directory.path}/$name');

    return File(imagePath).copy(image.path);
  }

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
              SizedBox(
                height: 20,
              ),
              image != null
                  ? ClipOval(
                      child: Image.file(
                        image!,
                        width: 100,
                        height: 100,
                        fit: BoxFit.fill,
                      ),
                    )
                  : FlutterLogo(
                      size: 100,
                    ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton.icon(
                    onPressed: () => pickImage(ImageSource.gallery),
                    icon: Icon(Icons.image_outlined),
                    label: Text(
                      'Pick from Gallery',
                      style: TextStyle(fontSize: 12),
                    ),
                  ),
                  TextButton.icon(
                    onPressed: () => pickImage(ImageSource.camera),
                    icon: Icon(Icons.camera_alt_outlined),
                    label: Text(
                      'Click a photo',
                      style: TextStyle(fontSize: 12),
                    ),
                  ),
                ],
              ),

              // "Name" form.
              const SizedBox(height: 24.0),
              firstname(),
              SizedBox(
                height: 5,
              ),
              lastName(),
              SizedBox(
                height: 15,
              ),
              id(),
              SizedBox(
                height: 15,
              ),
              phoneNo(),

              SizedBox(
                height: 15,
              ),
              institute(),
              SizedBox(
                height: 15,
              ),
              department(),
              SizedBox(
                height: 15,
              ),
              userBio(),
              SizedBox(
                height: 15,
              ),
              updateProfileButton(),
            ],
          ),
        ),
      ),
    );
  }

  /* ----------------- Method Extracted bewlow--------------*/
  /* ----------------- Method Extracted bewlow--------------*/
  /* ----------------- Method Extracted bewlow--------------*/
  /* ----------------- Method Extracted bewlow--------------*/

  ListTile institute() {
    return ListTile(
      title: const Text('Institute :'),
      trailing: DropdownButton(
        value: _btn3SelectedVal,
        hint: const Text('Choose'),
        onChanged: (String? newValue) {
          if (newValue != null) {
            setState(() => _btn3SelectedVal = newValue);
          }
        },
        items: _dropDownMenuItems,
      ),
    );
  }

  ListTile department() {
    return ListTile(
      title: const Text('Department :'),
      trailing: DropdownButton(
        value: _btn4SelectedVal,
        hint: const Text('Choose'),
        onChanged: (String? newValue) {
          if (newValue != null) {
            setState(() => _btn4SelectedVal = newValue);
          }
        },
        items: _dropDownMenuItems,
      ),
    );
  }

  ElevatedButton updateProfileButton() {
    return ElevatedButton.icon(
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
          saveUserProfile();
        }
      },
      label: Text(
        'Update Profile',
        style: TextStyle(fontSize: 16),
      ),
    );
  }

  TextFormField userBio() {
    return TextFormField(
      controller: bioController,
      decoration: const InputDecoration(
        icon: Icon(Icons.info),
        border: OutlineInputBorder(),
        hintText: 'Add your Bio...',
        helperText: 'Keep it short, this is just a demo.',
        labelText: 'Add your Bio',
      ),
      maxLines: 3,
    );
  }

  TextFormField phoneNo() {
    return TextFormField(
        controller: phoneController,
        decoration: const InputDecoration(
          border: OutlineInputBorder(),
          errorBorder:
              OutlineInputBorder(borderSide: BorderSide(color: Colors.red)),
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
        });
  }

  TextFormField id() {
    return TextFormField(
      controller: idController,
      textCapitalization: TextCapitalization.words,
      decoration: const InputDecoration(
        border: OutlineInputBorder(),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.red),
        ),
        filled: true,
        icon: Icon(Icons.contact_page),
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
      },
    );
  }

  Padding lastName() {
    return Padding(
      padding: const EdgeInsets.only(left: 39),
      child: TextFormField(
          controller: lnameController,
          textCapitalization: TextCapitalization.words,
          decoration: const InputDecoration(
            labelText: 'Last Name *',
            border: OutlineInputBorder(),
            errorBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.red),
            ),
          ),
          onSaved: (String? value) {
            this._lname = value;
            print('lname=$_lname');
          },
          validator: (value) {
            if (value == null || value.isEmpty) {
              return "Last Name cannot be empty";
            }
            return null;
          }),
    );
  }

  TextFormField firstname() {
    return TextFormField(
        controller: fnameController,
        textCapitalization: TextCapitalization.words,
        decoration: const InputDecoration(
          icon: Icon(Icons.person),
          labelText: 'First Name *',
          border: OutlineInputBorder(),
          errorBorder:
              OutlineInputBorder(borderSide: BorderSide(color: Colors.red)),
        ),
        onSaved: (String? value) {
          this._fname = value;
          print('fname=$_fname');
        },
        validator: (value) {
          if (value == null || value.isEmpty) {
            return "First Name cannot be empty";
          }
          return null;
        });
  }

  //Firebase Realtime database part

  TextEditingController fnameController = TextEditingController();
  TextEditingController lnameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController idController = TextEditingController();
  TextEditingController bioController = TextEditingController();

  void saveUserProfile() async {
    CollectionReference ref2 = FirebaseFirestore.instance
        .collection('users')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .collection('userprofile');

    var data = {
      'Fname  ': fnameController.text,
      'Lname  ': lnameController.text,
      'Phone ': phoneController.text,
      'Bio   ': bioController.text,
      'id   ': idController.text,
    };

    ref2.add(data);
  }
}
