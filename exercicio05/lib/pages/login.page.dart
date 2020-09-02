import 'package:exercicio05/pages/register.page.dart';
import 'package:exercicio05/utils/colors.utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../components/input.widget.dart';

class LoginPage extends StatefulWidget {
  static const String route = '/login';

  LoginPage({Key key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController _emailAddressController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  GlobalKey<FormState> _formKeyLogin = GlobalKey<FormState>();

  _login() {
    if (_formKeyLogin.currentState.validate()) {
      print('Logged in');
    }
  }

  _goToRegister(BuildContext context) {
    Navigator.of(context).pushNamed(RegisterPage.route);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 100),
            Container(
              padding: EdgeInsets.only(
                right: 20,
                left: 20,
              ),
              child: Form(
                key: _formKeyLogin,
                child: Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          'Login',
                          style: TextStyle(
                            color: Color(0xFF000000),
                            fontSize: 35,
                            fontStyle: FontStyle.italic,
                          ),
                        ),
                      ],
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
                      inputController: _passwordController,
                      textPlaceholder: 'Password',
                      obscureText: true,
                      keyboardType: TextInputType.visiblePassword,
                      required: true,
                    ),
                    SizedBox(height: 15),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        GestureDetector(
                          child: Text(
                            'Dont Have an Account?',
                            style: TextStyle(
                                color: ColorUtil.colorRed, fontSize: 15),
                          ),
                          onTap: () => _goToRegister(context),
                        )
                      ],
                    ),
                    SizedBox(height: 25),
                    CupertinoButton(
                      color: ColorUtil.colorRed,
                      onPressed: _login,
                      child: Container(
                        width: double.infinity,
                        height: 24,
                        child: Center(
                          child: Text(
                            'Continue',
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
