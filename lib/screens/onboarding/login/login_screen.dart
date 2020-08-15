import 'package:codeclanmobile/blocs/blocs.dart';
import 'package:codeclanmobile/blocs/login_bloc.dart';
import 'package:codeclanmobile/common/snack_bar.dart';
import 'package:codeclanmobile/repositories/user_repository.dart';
import 'package:codeclanmobile/screens/onboarding/login/login_form.dart';
import 'package:codeclanmobile/screens/onboarding/register/register.dart';
import 'package:codeclanmobile/utils/spaces.dart';
import 'package:codeclanmobile/values/values.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

class LoginScreen extends StatefulWidget {
  final UserRepository userRepository;

  const LoginScreen({Key key, @required this.userRepository})
      : assert(userRepository != null),
        super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: BlocProvider(
            create: (context) {
              return LoginBloc(
                authenticationBloc:
                    BlocProvider.of<AuthenticationBloc>(context),
                userRepository: widget.userRepository,
              );
            },
            child: BlocListener<LoginBloc, LoginState>(
                listener: (BuildContext context, LoginState state) {
                  if (state is LoginFailure) {
                    CodeClanSnackBar.showErrorSnackBar(context,
                        message: state.error);
                  }
                },
                child: SafeArea(
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          SizedBox(
                            height: 50,
                          ),
                          Text('Log in.',
                              style: GoogleFonts.poppins(
                                  color: AppColors.buttonShade1,
                                  fontSize: 25,
                                  fontWeight: FontWeight.w500)),
                          Text('Sign in to your Code Clan account.',
                              style: GoogleFonts.poppins(
                                  color: Colors.black87,
                                  fontSize: 13,
                                  fontWeight: FontWeight.w300)),
                          SizedBox(
                            height: 30,
                          ),
                          Container(
                              height: 200,
                              child: Center(
                                  child: Lottie.asset(
                                      'assets/interactions/login_interaction.json'))),
                          SpaceH16(),
                          LoginForm(
                            userRepository: widget.userRepository,
                          ),
                          SpaceH16(),
                          Center(
                            child: RichText(
                              text: TextSpan(
                                  text: 'Don\`t have an account? ',
                                  style: GoogleFonts.poppins(
                                      textStyle: TextStyle(
                                          color: Color(0xFF666666),
                                          fontWeight: FontWeight.w400,
                                          fontSize: 12)),
                                  children: <TextSpan>[
                                    TextSpan(
                                        recognizer: TapGestureRecognizer()
                                          ..onTap = () {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      RegisterScreen(
                                                        userRepository: widget
                                                            .userRepository,
                                                      )),
                                            );
                                          },
                                        text: 'Register',
                                        style: GoogleFonts.poppins(
                                            textStyle: TextStyle(
                                                color: AppColors.buttonShade1,
                                                fontSize: 12,
                                                fontWeight: FontWeight.bold)))
                                  ]),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ))));
  }
}
