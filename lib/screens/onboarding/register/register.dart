import 'package:codeclanmobile/blocs/register_bloc.dart';
import 'package:codeclanmobile/repositories/repositories.dart';
import 'package:codeclanmobile/screens/onboarding/register/register_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_icons/flutter_icons.dart';

import 'register_success.dart';

class RegisterScreen extends StatelessWidget {
  final UserRepository userRepository;

  const RegisterScreen({Key key, @required this.userRepository})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
            backgroundColor: Colors.white,
            elevation: 0,
            leading: InkWell(
              onTap: () => Navigator.of(context).pop(),
              child: Icon(
                Feather.chevron_left,
                color: Colors.black,
              ),
            )),
        body: BlocProvider(
            create: (BuildContext context) {
              return RegisterBloc(userRepository: userRepository);
            },
            child: BlocListener<RegisterBloc, RegisterState>(
              listener: (BuildContext context, RegisterState state) {
                if (state is RegisterFailure) {
                  Scaffold.of(context).showSnackBar(
                    SnackBar(
                      content: Text('${state.error}'),
                      backgroundColor: Colors.red,
                    ),
                  );
                }
                if (state is RegisterSuccess) {
                  Route route = MaterialPageRoute(
                      builder: (context) => RegisterSuccessScreen());
                  Navigator.pushReplacement(context, route);
                }
                if (state is RegisterFailure) {
                  Route route = MaterialPageRoute(
                      builder: (context) => RegisterSuccessScreen());
                  Navigator.pushReplacement(context, route);
                }
              },
              child: RegisterForm(
                userRepository: userRepository,
              ),
            )));
  }
}
