import 'package:codeclanmobile/blocs/register_bloc.dart';
import 'package:codeclanmobile/common/custom_button.dart';
import 'package:codeclanmobile/common/custom_text_form_field.dart';
import 'package:codeclanmobile/models/register_user_dto.dart';
import 'package:codeclanmobile/repositories/repositories.dart';
import 'package:codeclanmobile/services/input_validation/login_validation.dart';
import 'package:codeclanmobile/utils/spaces.dart';
import 'package:codeclanmobile/values/values.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class RegisterForm extends StatefulWidget {
  final UserRepository userRepository;

  const RegisterForm({Key key, @required this.userRepository})
      : super(key: key);
  @override
  _RegisterFormState createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool _showPassword = true;
  @override
  Widget build(BuildContext context) {
    _onRegisterButtonPressed() {
      RegisterUserDto registerUserDto = new RegisterUserDto();
      registerUserDto.email = _emailController.text.trim();
      registerUserDto.firstName = _firstNameController.text;
      registerUserDto.lastName = _lastNameController.text;
      registerUserDto.password = _passwordController.text;

      if (_formKey.currentState.validate())
        BlocProvider.of<RegisterBloc>(context)
            .add(RegisterButtonPressed(registerUserDto: registerUserDto));
    }

    return BlocBuilder<RegisterBloc, RegisterState>(
        builder: (BuildContext context, RegisterState state) {
      return Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(
                    height: 20,
                  ),
                  Text('Register.',
                      style: GoogleFonts.poppins(
                          color: Colors.black87,
                          fontSize: 25,
                          fontWeight: FontWeight.w500)),
                  Text('Create a Code Clan account.',
                      style: GoogleFonts.poppins(
                          color: Colors.black87,
                          fontSize: 13,
                          fontWeight: FontWeight.w300)),
                  SizedBox(
                    height: 30,
                  ),
                  CustomTextFormField(
                    controller: _firstNameController,
                    hasPrefixIcon: true,
                    focusedBorder: OutlineInputBorder(
                      borderSide: new BorderSide(color: Colors.white),
                      borderRadius: new BorderRadius.circular(5),
                    ),
                    contentPadding: const EdgeInsets.only(
                        left: 14.0, bottom: 8.0, top: 8.0),
                    textInputType: TextInputType.text,
                    titleStyle: GoogleFonts.poppins(
                        textStyle:
                            TextStyle(color: Color(0xFF666666), fontSize: 12)),
                    hasTitle: true,
                    hintTextStyle: GoogleFonts.poppins(
                        textStyle:
                            TextStyle(color: Color(0xFF666666), fontSize: 12)),
                    //textStyle: Styles.customTextStyle(color: AppColors.white),
                    hintText: 'First Name',
                    title: '',
                    validator: (value) {
                      //This Validates Login Input
                      LoginValidation loginValidation = new LoginValidation();
                      var validation = loginValidation.isNameValid(value);
                      if (!validation.isValidated) {
                        return validation.error.first;
                      }
                      return null;
                    },
                  ),
                  SpaceH8(),
                  CustomTextFormField(
                    controller: _lastNameController,
                    hasPrefixIcon: true,
                    focusedBorder: OutlineInputBorder(
                      borderSide: new BorderSide(color: Colors.white),
                      borderRadius: new BorderRadius.circular(5),
                    ),
                    contentPadding: const EdgeInsets.only(
                        left: 14.0, bottom: 8.0, top: 8.0),
                    textInputType: TextInputType.text,
                    titleStyle: GoogleFonts.poppins(
                        textStyle:
                            TextStyle(color: Color(0xFF666666), fontSize: 12)),
                    hasTitle: true,
                    hintTextStyle: GoogleFonts.poppins(
                        textStyle:
                            TextStyle(color: Color(0xFF666666), fontSize: 12)),
                    //textStyle: Styles.customTextStyle(color: AppColors.white),
                    hintText: 'Last Name',
                    title: '',
                    validator: (value) {
                      //This Validates Login Input
                      LoginValidation loginValidation = new LoginValidation();
                      var validation = loginValidation.isNameValid(value);
                      if (!validation.isValidated) {
                        return validation.error.first;
                      }
                      return null;
                    },
                  ),
                  SpaceH8(),
                  CustomTextFormField(
                    controller: _emailController,
                    hasPrefixIcon: true,
                    focusedBorder: OutlineInputBorder(
                      borderSide: new BorderSide(color: Colors.white),
                      borderRadius: new BorderRadius.circular(5),
                    ),
                    contentPadding: const EdgeInsets.only(
                        left: 14.0, bottom: 8.0, top: 8.0),
                    textInputType: TextInputType.text,
                    titleStyle: GoogleFonts.poppins(
                        textStyle:
                            TextStyle(color: Color(0xFF666666), fontSize: 12)),
                    hasTitle: true,
                    hintTextStyle: GoogleFonts.poppins(
                        textStyle:
                            TextStyle(color: Color(0xFF666666), fontSize: 12)),
                    //textStyle: Styles.customTextStyle(color: AppColors.white),
                    hintText: 'Email Address',
                    title: '',
                    validator: (value) {
                      //This Validates Login Input
                      LoginValidation loginValidation = new LoginValidation();
                      var validation = loginValidation.isEmailValid(value);
                      if (!validation.isValidated) {
                        return validation.error.first;
                      }
                      return null;
                    },
                  ),
                  SpaceH8(),
                  CustomTextFormField(
                    controller: _passwordController,
                    hasPrefixIcon: true,
                    focusedBorder: OutlineInputBorder(
                      borderSide: new BorderSide(color: Colors.white),
                      borderRadius: new BorderRadius.circular(5),
                    ),
                    contentPadding: const EdgeInsets.only(
                        left: 14.0, bottom: 8.0, top: 8.0),
                    textInputType: TextInputType.text,
                    titleStyle: GoogleFonts.poppins(
                        textStyle:
                            TextStyle(color: Color(0xFF666666), fontSize: 12)),
                    hasTitle: true,
                    hintTextStyle: GoogleFonts.poppins(
                        textStyle:
                            TextStyle(color: Color(0xFF666666), fontSize: 12)),
                    //textStyle: Styles.customTextStyle(color: AppColors.white),
                    hintText: 'Password',
                    obscured: _showPassword,
                    title: '',
                    hasSuffixIcon: true,
                    suffixIcon: GestureDetector(
                      onTap: () {
                        setState(() {
                          _showPassword = !_showPassword;
                        });
                      },
                      child: Icon(
                          _showPassword
                              ? Icons.visibility
                              : Icons.visibility_off,
                          color: Colors.grey),
                    ),
                    validator: (value) {
                      //This Validates Login Input
                      LoginValidation loginValidation = new LoginValidation();
                      var validation = loginValidation.isPasswordValid(value);
                      if (!validation.isValidated) {
                        return validation.error.first;
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 70),
                  CustomButton(
                    title: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        RichText(
                            text: TextSpan(
                                text: state is RegisterLoading
                                    ? 'Creating '
                                    : 'Create ',
                                children: <TextSpan>[
                              TextSpan(
                                  text: 'Account',
                                  style: GoogleFonts.poppins(
                                      textStyle: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold)))
                            ])),
                        SpaceW12(),
                        state is RegisterLoading
                            ? CircularProgressIndicator(
                                backgroundColor: Colors.white,
                              )
                            : Container()
                      ],
                    ),
                    borderRadius: 3,
                    color: AppColors.buttonShade1,
                    onPressed: state is! RegisterLoading
                        ? _onRegisterButtonPressed
                        : () {},
                    textStyle: GoogleFonts.poppins(
                        textStyle: TextStyle(color: Colors.white)),
                  ),
                  SpaceH16(),
                  Center(
                    child: RichText(
                      text: TextSpan(
                          text: 'Already created an account? ',
                          style: GoogleFonts.poppins(
                              textStyle: TextStyle(
                                  color: Color(0xFF666666),
                                  fontWeight: FontWeight.w400,
                                  fontSize: 12)),
                          children: <TextSpan>[
                            TextSpan(
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    Navigator.pop(context);
                                  },
                                text: 'Sign in',
                                style: GoogleFonts.poppins(
                                    textStyle: TextStyle(
                                        color: Color(0xFFCE74AB),
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold)))
                          ]),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}
