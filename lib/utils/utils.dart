import 'constants.dart' as Constants;

isValidEmail(String email) {
  return RegExp(Constants.emailValidationRegex).hasMatch(email);
}

getStateBasedOnCountry(String selectedCountry) {
  switch (selectedCountry) {
    case 'India':
      return Constants.indianStates;
    case 'United States':
      return Constants.usaStates;
    case 'Canada':
      return Constants.canadaStates;
    case '':
      return [
        {
          "display": Constants.emptyString,
          "value": Constants.emptyString,
        }
      ];
  }
}
