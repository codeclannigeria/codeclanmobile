import 'package:codeclanmobile/screens/dashboard/dashboard_screen.dart';
import 'package:codeclanmobile/screens/onboarding/login/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import 'blocs/blocs.dart';
import 'common/loading_indicator.dart';
import 'repositories/repositories.dart';
import 'screens/splash/splash_screen.dart';
import 'services/service_locator.dart';
import 'services/storage/shared_pref_service.dart';

class SimpleBlocDelegate extends BlocDelegate {
  @override
  void onEvent(Bloc bloc, Object event) {
    print(event);
    super.onEvent(bloc, event);
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    print(transition);
    super.onTransition(bloc, transition);
  }

  @override
  void onError(Bloc bloc, Object error, StackTrace stackTrace) {
    print(error);
    super.onError(bloc, error, stackTrace);
  }
}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setupLocator();
  await StorageUtil.getInstance();
  BlocSupervisor.delegate = SimpleBlocDelegate();
  final userRepository = UserRepository();
  runApp(
    BlocProvider<AuthenticationBloc>(
      create: (context) {
        return AuthenticationBloc(userRepository: userRepository)
          ..add(AuthenticationStarted());
      },
      child: App(userRepository: userRepository),
    ),
  );
}

class App extends StatelessWidget {
  final UserRepository userRepository;

  const App({Key key, this.userRepository}) : super(key: key);
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return FlutterEasyLoading(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: BlocBuilder<AuthenticationBloc, AuthenticationState>(
          bloc: BlocProvider.of<AuthenticationBloc>(context),
          builder: (context, state) {
            if (state is AuthenticationSuccess) {
              return DashboardScreen();
            }
            if (state is AuthenticationFailure) {
              return LoginScreen(userRepository: userRepository);
            }
            if (state is AuthenticationInProgress) {
              return LoadingIndicator();
            }
            return SplashScreen();
          },
        ),
      ),
    );
  }
}
