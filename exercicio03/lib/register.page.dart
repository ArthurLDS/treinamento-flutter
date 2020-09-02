import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'input.widget.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  Color _colorRed = Color(0xFFE83F3F);

  TextEditingController _fullnameController = TextEditingController();
  TextEditingController _emailAddressController = TextEditingController();
  TextEditingController _mobileAddressAddressController =
      TextEditingController();
  TextEditingController _countryController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _confirmPasswordController = TextEditingController();
  TextEditingController _referalCodeController = TextEditingController();

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  _printInfos() {
    print('''
      ** USER REGISTRED WITH SUCCESS **
      - Fullname: ${_fullnameController.text}
      - Email Address: ${_emailAddressController.text}
      - Mobile Address: ${_mobileAddressAddressController.text}
      - Contry: ${_countryController.text}
      - Referal Code: ${_referalCodeController.text}
      - Password: ********
    ''');
  }

  _clearFields() {
    _fullnameController.text = '';
    _emailAddressController.text = '';
    _mobileAddressAddressController.text = '';
    _countryController.text = '';
    _passwordController.text = '';
    _confirmPasswordController.text = '';
    _referalCodeController.text = '';

    setState(() {
      _formKey = GlobalKey();
    });

  }

  _register() {
    if (_formKey.currentState.validate()) {
      _printInfos();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 25),
            Container(
              child: Align(
                alignment: Alignment.topRight,
                child: CupertinoButton(
                  onPressed: _clearFields,
                  child: Text(
                    'Clear',
                    style: TextStyle(
                      color: _colorRed,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.only(
                right: 20,
                left: 20,
              ),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          'Register',
                          style: TextStyle(
                            color: Color(0xFF000000),
                            fontSize: 35,
                            fontStyle: FontStyle.italic,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                    InputWidget(
                      inputController: _fullnameController,
                      textPlaceholder: 'Fullname',
                      textCapitalization: TextCapitalization.words,
                      required: true,
                    ),
                    SizedBox(height: 6),
                    InputWidget(
                      inputController: _emailAddressController,
                      keyboardType: TextInputType.emailAddress,
                      textPlaceholder: 'Email Address',
                      required: true,
                    ),
                    SizedBox(height: 6),
                    InputWidget(
                      inputController: _mobileAddressAddressController,
                      keyboardType: TextInputType.phone,
                      textPlaceholder: 'Mobile Address',
                      required: true,
                    ),
                    SizedBox(height: 6),
                    InputWidget(
                      inputController: _countryController,
                      textPlaceholder: 'Country',
                      required: true,
                    ),
                    SizedBox(height: 6),
                    InputWidget(
                      inputController: _passwordController,
                      textPlaceholder: 'Password',
                      obscureText: true,
                      keyboardType: TextInputType.visiblePassword,
                      required: true,
                    ),
                    SizedBox(height: 6),
                    InputWidget(
                      inputController: _confirmPasswordController,
                      textPlaceholder: 'Confirm Password',
                      obscureText: true,
                      keyboardType: TextInputType.visiblePassword,
                      validator: (value) => value != _passwordController.text
                          ? 'Senhas não conferem'
                          : null,
                    ),
                    SizedBox(height: 6),
                    InputWidget(
                      inputController: _referalCodeController,
                      textPlaceholder: 'Referal Code (Optional)',
                      keyboardType: TextInputType.visiblePassword,
                    ),
                    SizedBox(height: 10),
                    CupertinoButton(
                      color: _colorRed,
                      onPressed: _register,
                      child: Container(
                        width: double.infinity,
                        height: 24,
                        child: Center(
                          child: Text(
                            'Register',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontStyle: FontStyle.italic,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 15),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
