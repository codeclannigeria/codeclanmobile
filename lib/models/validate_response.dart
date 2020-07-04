
class ValidateResponse {
   List<String> error;
   bool isValidated;
  ValidateResponse(this.error, this.isValidated);

  void isInvalid(String message){
    if(error==null)error = new List<String>();
    this.isValidated=false;
    error.add(message);
  }

}

