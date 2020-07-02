import 'package:codeclanmobile/models/validate_response.dart';
import 'package:email_validator/email_validator.dart';

class LoginValidation{
  var validationResponse = ValidateResponse(null,true);
  final String email;
  final String password;
  LoginValidation({this.email,this.password});


  ValidateResponse isEmailOrPasswordValid(){
    if(email.isEmpty||password.isEmpty)
      validationResponse.isInvalid('Email or Password cannot be empty or spaces');
    //This uses a plugin to validate if the email is a valid email address
    if(!EmailValidator.validate(email))
    validationResponse.isInvalid('Email Address is not a valid Email');
    return validationResponse;
 }
}

