import 'package:codeclanmobile/blocs/blocs.dart';
import 'package:codeclanmobile/blocs/login_bloc.dart';
import 'package:codeclanmobile/repositories/user_repository.dart';
import 'package:codeclanmobile/screens/onboarding/login/login_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
                  Scaffold.of(context).showSnackBar(
                    SnackBar(
                      content: Text('${state.error}'),
                      backgroundColor: Colors.red,
                    ),
                  );
                }
              },
              child: SafeArea(child: LoginForm()),
            )));
  }
}
