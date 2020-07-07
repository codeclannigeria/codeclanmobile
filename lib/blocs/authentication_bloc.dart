import 'package:codeclanmobile/repositories/repositories.dart';
import 'package:codeclanmobile/services/api/models/user_dto.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  final UserRepository userRepository;

  AuthenticationBloc({@required this.userRepository})
      : assert(userRepository != null);

  @override
  AuthenticationState get initialState => AuthenticationUninitialized();

  @override
  Stream<AuthenticationState> mapEventToState(
    AuthenticationEvent event,
  ) async* {
    if (event is AuthenticationStarted) {
      final bool hasToken = await userRepository.hasToken();
      // final UserDto user = await userRepository.getUserProfile();
      if (hasToken) {
        final UserDto user = await userRepository.getUserProfile();
        yield AuthenticationSuccess(user: user);
      } else {
        yield AuthenticationFailure();
      }
    }

    if (event is AuthenticationLoggedIn) {
      yield AuthenticationInProgress();
      final UserDto user = await userRepository.getUserProfile();
      await userRepository.persistToken(event.token);
      yield AuthenticationSuccess(user: user);
    }

    if (event is LoggedOut) {
      yield AuthenticationInProgress();
      await userRepository.deleteToken();
      yield AuthenticationFailure();
    }
  }
}

/// Authentication Events

abstract class AuthenticationEvent extends Equatable {
  const AuthenticationEvent();

  @override
  List<Object> get props => [];
}

class AuthenticationStarted extends AuthenticationEvent {}

class AuthenticationLoggedIn extends AuthenticationEvent {
  final String token;

  const AuthenticationLoggedIn({@required this.token});

  @override
  List<Object> get props => [token];

  @override
  String toString() => 'LoggedIn { token: $token }';
}

class LoggedOut extends AuthenticationEvent {}

/// Authentication States
/// This is used to maintain states of authentication
abstract class AuthenticationState extends Equatable {
  @override
  List<Object> get props => [];
}

class AuthenticationUninitialized extends AuthenticationState {}

class AuthenticationSuccess extends AuthenticationState {
  final UserDto user;

  AuthenticationSuccess({@required this.user});
}

class AuthenticationFailure extends AuthenticationState {}

class AuthenticationInProgress extends AuthenticationState {}
