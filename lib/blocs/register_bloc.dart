import 'package:codeclanmobile/models/register_user_dto.dart';
import 'package:codeclanmobile/repositories/repositories.dart';
import 'package:codeclanmobile/services/api/models/acct_verification_dto.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:meta/meta.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  final UserRepository userRepository;
  RegisterBloc({@required this.userRepository})
      : assert(userRepository != null),
        super(RegisterInitial());

  @override
  Stream<RegisterState> mapEventToState(
    RegisterEvent event,
  ) async* {
    if (event is RegisterButtonPressed) {
      AccountVerificationDto accountVerificationDto =
          new AccountVerificationDto();
      EasyLoading.show(status: 'Creating your account...');
      yield RegisterLoading();
      try {
        await userRepository.register(registerUserDto: event.registerUserDto);
        accountVerificationDto.clientBaseUrl =
            'https://www.codeclannigeria.dev/confirm-email';
        accountVerificationDto.email = event.registerUserDto.email;
        accountVerificationDto.tokenParamName = 'token';
        accountVerificationDto.emailParamName = 'email';
        userRepository.sendVerificationEmail(
            accountVerificationDto: accountVerificationDto);
        EasyLoading.dismiss();
        yield RegisterSuccess();
      } catch (e) {
        EasyLoading.dismiss();
        yield RegisterFailure(error: e.toString());
      }
    }
  }
}

abstract class RegisterEvent extends Equatable {
  const RegisterEvent();
}

class RegisterButtonPressed extends RegisterEvent {
  final RegisterUserDto registerUserDto;

  const RegisterButtonPressed({
    @required this.registerUserDto,
  });
  @override
  List<Object> get props => [registerUserDto];

  @override
  String toString() => 'RegisterButtonPressed ${registerUserDto.toJson()}';
}

abstract class RegisterState extends Equatable {
  const RegisterState();
  @override
  List<Object> get props => [];
}

class RegisterInitial extends RegisterState {}

class RegisterLoading extends RegisterState {}

class RegisterSuccess extends RegisterState {}

class RegisterFailure extends RegisterState {
  final String error;

  const RegisterFailure({@required this.error});

  @override
  String toString() => 'RegisterFailure { error: $error }';
}
