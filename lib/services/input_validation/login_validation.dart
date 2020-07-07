import 'package:codeclanmobile/models/validate_response.dart';
import 'package:email_validator/email_validator.dart';

class LoginValidation{
  var validationResponse = ValidateResponse(null,true);
   String email;
   String password;


  ValidateResponse isEmailValid(email){
    if(email.isEmpty)
      validationResponse.isInvalid('Email cannot be empty or spaces');
    //This uses a plugin to validate if the email is a valid email address
    if(!EmailValidator.validate(email))
    validationResponse.isInvalid('Email Address is not a valid Email');
    return validationResponse;
 }
  ValidateResponse isPasswordValid(password){
    if(password.isEmpty)
      validationResponse.isInvalid('Password cannot be empty or spaces');
    return validationResponse;
  }
}

