import 'package:codeclanmobile/blocs/login_bloc.dart';
import 'package:codeclanmobile/common/custom_button.dart';
import 'package:codeclanmobile/common/custom_text_form_field.dart';
import 'package:codeclanmobile/repositories/repositories.dart';
import 'package:codeclanmobile/screens/onboarding/password/password.dart';
import 'package:codeclanmobile/utils/spaces.dart';
import 'package:codeclanmobile/values/values.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginForm extends StatefulWidget {
  final UserRepository userRepository;

  const LoginForm({Key key, @required this.userRepository}) : super(key: key);
  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    _onLoginButtonPressed() {
      print('Login button hit');
      BlocProvider.of<LoginBloc>(context).add(
        LoginButtonPressed(
          email: _emailController.text,
          password: _passwordController.text,
        ),
      );
    }

    return BlocBuilder<LoginBloc, LoginState>(
        builder: (BuildContext context, LoginState state) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          CustomTextFormField(
            controller: _emailController,
            hasPrefixIcon: true,
            focusedBorder: OutlineInputBorder(
              borderSide: new BorderSide(color: Colors.white),
              borderRadius: new BorderRadius.circular(5),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: new BorderSide(color: Colors.white),
              borderRadius: new BorderRadius.circular(5),
            ),
            contentPadding:
                const EdgeInsets.only(left: 14.0, bottom: 8.0, top: 8.0),
            textInputType: TextInputType.text,
            titleStyle: GoogleFonts.poppins(
                textStyle: TextStyle(color: Color(0xFF666666), fontSize: 12)),
            hasTitle: true,
            hintTextStyle: GoogleFonts.poppins(
                textStyle: TextStyle(color: Color(0xFF666666), fontSize: 12)),
            //textStyle: Styles.customTextStyle(color: AppColors.white),
            hintText: 'Email Address',
            title: '',
          ),
          SpaceH8(),
          CustomTextFormField(
            controller: _passwordController,
            hasPrefixIcon: true,
            focusedBorder: OutlineInputBorder(
              borderSide: new BorderSide(color: Colors.white),
              borderRadius: new BorderRadius.circular(5),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: new BorderSide(color: Colors.white),
              borderRadius: new BorderRadius.circular(5),
            ),
            contentPadding:
                const EdgeInsets.only(left: 14.0, bottom: 8.0, top: 8.0),
            textInputType: TextInputType.text,
            titleStyle: GoogleFonts.poppins(
                textStyle: TextStyle(color: Color(0xFF666666), fontSize: 12)),
            hasTitle: true,
            hintTextStyle: GoogleFonts.poppins(
                textStyle: TextStyle(color: Color(0xFF666666), fontSize: 12)),
            //textStyle: Styles.customTextStyle(color: AppColors.white),
            hintText: 'Password',
            obscured: true,
            title: '',
          ),
          SizedBox(height: 70),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              GestureDetector(
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ForgetpasswordScreen()),
                ),
                child: Text('Forgot password?',
                    style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                            fontSize: 12,
                            color: AppColors.buttonShade1,
                            fontWeight: FontWeight.bold))),
              ),
            ],
          ),
          SpaceH16(),
          CustomButton(
            title: state is LoginInProgress
                ? CircularProgressIndicator()
                : RichText(
                    text: TextSpan(text: 'Log me ', children: <TextSpan>[
                    TextSpan(
                        text: 'in',
                        style: GoogleFonts.poppins(
                            textStyle: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold)))
                  ])),
            borderRadius: 3,
            color: Colors.black87,
            onPressed: state is! LoginInProgress ? _onLoginButtonPressed : null,
            textStyle:
                GoogleFonts.poppins(textStyle: TextStyle(color: Colors.white)),
          ),
        ],
      );
    });
  }
}
