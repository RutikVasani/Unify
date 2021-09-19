import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/utils/routes.dart';

class Query extends StatefulWidget {
  const Query({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _QueryState();
}

class _QueryState extends State<Query> {
  String name = "";
  bool changeButton = false;

  final _formKey2 = GlobalKey<FormState>();
  moveToQuerySubmit(BuildContext context) async {
    if (_formKey2.currentState!.validate()) {
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

  String? _btn2SelectedVal;

  String? _name;
  String? _id;
  String? _phoneNumber;
  String? _email;

  @override
  Widget build(BuildContext context) {
    return Material(
      child: SingleChildScrollView(
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
                    border: UnderlineInputBorder(),
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
                    border: UnderlineInputBorder(),
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
              // "Email" form.
              TextFormField(
                decoration: const InputDecoration(
                  border: UnderlineInputBorder(),
                  filled: true,
                  icon: Icon(Icons.email),
                  hintText: 'Your email address',
                  labelText: 'E-mail',
                ),
                keyboardType: TextInputType.emailAddress,
                onSaved: (String? value) {
                  this._email = value;
                  print('email=$_email');
                },
              ),
              const SizedBox(height: 24.0),
              // "Name" form.
              TextFormField(
                  textCapitalization: TextCapitalization.words,
                  decoration: const InputDecoration(
                    border: UnderlineInputBorder(),
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
              const SizedBox(height: 24.0),
              // "Life story" form.
              TextFormField(
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Write your Query',
                  helperText: 'Keep it short, this is just a demo.',
                  labelText: 'Ask Your Query / Doubts',
                ),
                maxLines: 3,
              ),
              const SizedBox(height: 24.0),
              // "Password" form.
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
                    borderRadius: BorderRadius.circular(changeButton ? 50 : 8)),
                child: Material(
                  color: Colors.white.withOpacity(0),
                  child: InkWell(
                    onTap: () => moveToQuerySubmit(context),
                    child: AnimatedContainer(
                      duration: Duration(seconds: 1),
                      height: 50,
                      width: changeButton ? 50 : 10,
                      alignment: Alignment.center,
                      child: changeButton
                          ? Icon(
                              Icons.done,
                              color: Colors.white,
                            )
                          : Text("Submit",
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
    );
  }
}

class PasswordField extends StatefulWidget {
  const PasswordField({
    this.fieldKey,
    this.hintText,
    this.labelText,
    this.helperText,
    this.onSaved,
    this.validator,
    this.onFieldSubmitted,
  });

  final Key? fieldKey;
  final String? hintText;
  final String? labelText;
  final String? helperText;
  final FormFieldSetter<String>? onSaved;
  final FormFieldValidator<String>? validator;
  final ValueChanged<String>? onFieldSubmitted;

  @override
  _PasswordFieldState createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      key: widget.fieldKey,
      obscureText: _obscureText,
      maxLength: 8,
      onSaved: widget.onSaved,
      validator: widget.validator,
      onFieldSubmitted: widget.onFieldSubmitted,
      decoration: InputDecoration(
        border: const UnderlineInputBorder(),
        filled: true,
        hintText: widget.hintText,
        labelText: widget.labelText,
        helperText: widget.helperText,
        suffixIcon: GestureDetector(
          onTap: () {
            setState(() {
              _obscureText = !_obscureText;
            });
          },
          child: Icon(_obscureText ? Icons.visibility : Icons.visibility_off),
        ),
      ),
    );
  }
}
