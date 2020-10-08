import 'package:flutter/material.dart';
import 'utils/constants.dart' as Constants;
import 'utils/utils.dart' as Utils;
import 'package:dropdown_formfield/dropdown_formfield.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.grey,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final _feedBackFormKey = GlobalKey<FormState>();

// Variables to store user entered details in text ui.
  String selectOptionValue = Constants.emptyString;
  String registrationNoValue = Constants.emptyString;
  String dealerValue = Constants.emptyString;

  String pidMRORMSValue = Constants.emptyString;
  String pidNameValue = Constants.emptyString;
  String pidMobileValue = Constants.emptyString;
  String pidEmailValue = Constants.emptyString;
  String pidAddressLine1Value = Constants.emptyString;
  String pidAddressLine2Value = Constants.emptyString;
  String pidSelectStateValue = Constants.emptyString;
  String pidSelectCountryValue = Constants.emptyString;
  String pidPincodevalue = Constants.emptyString;
  String pidDescriptionValue = Constants.emptyString;

  @override
  void initState() {
    super.initState();
    selectOptionValue = Constants.emptyString;
    dealerValue = Constants.emptyString;
    pidSelectCountryValue = Constants.emptyString;
    pidSelectStateValue = Constants.emptyString;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          title: Text(
            Constants.appBarTitle,
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          ),
          backgroundColor: Colors.white,
          elevation: 0,
        ),
        body: GestureDetector(
          onTap: () {
            FocusScope.of(context).requestFocus(new FocusNode());
          },
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Container(
              color: Colors.white,
              padding: EdgeInsets.all(20),
              child: Form(
                key: _feedBackFormKey,
                child: SingleChildScrollView(
                  child: Wrap(
                    children: [
                      DropDownFormField(
                        titleText: Constants.selectModelLabelText,
                        hintText: 'Please choose one',
                        value: selectOptionValue,
                        onSaved: (value) {
                          setState(() {
                            selectOptionValue = value;
                          });
                        },
                        onChanged: (value) {
                          setState(() {
                            selectOptionValue = value;
                          });
                        },
                        dataSource: Constants.modelDetails,
                        textField: 'display',
                        valueField: 'value',
                      ),
                      TextFormField(
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Enter registration no*';
                          } else {
                            return null;
                          }
                        },
                        decoration: InputDecoration(
                          labelText: Constants.registrationNoLabelText,
                        ),
                        onChanged: (text) {
                          setState(() {
                            registrationNoValue = text;
                          });
                        },
                      ),
                      DropDownFormField(
                        titleText: Constants.selectDealerLabelText,
                        hintText: 'Please choose dealer',
                        value: dealerValue,
                        onSaved: (value) {
                          setState(() {
                            dealerValue = value;
                          });
                        },
                        onChanged: (value) {
                          setState(() {
                            dealerValue = value;
                          });
                        },
                        dataSource: Constants.dealerDetails,
                        textField: 'display',
                        valueField: 'value',
                        validator: (value) {
                          if (value == null) {
                            return 'Select dealer*';
                          } else if (value.isEmpty) {
                            return 'Select dealer*';
                          } else {
                            return null;
                          }
                        },
                      ),
                      SizedBox(height: 100),
                      Center(
                          child: Text(
                        Constants.personalInfoSectionTitle,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16.0),
                      )),
                      SizedBox(height: 40),
                      TextFormField(
                        validator: (value) {
                          if (value.isEmpty) {
                            return Constants.nameValidString;
                          } else {
                            return null;
                          }
                        },
                        decoration:
                            InputDecoration(labelText: Constants.nameLabelText),
                        onChanged: (text) {
                          setState(() {
                            pidNameValue = text;
                          });
                        },
                      ),
                      TextFormField(
                        validator: (value) {
                          if (value.isEmpty) {
                            return Constants.mobileNumberValidationString;
                          } else {
                            return null;
                          }
                        },
                        keyboardType: TextInputType.phone, // Phone keyboard
                        decoration: InputDecoration(
                          labelText: Constants.mobileLabelText,
                        ),
                        onChanged: (text) {
                          setState(() {
                            pidMobileValue = text;
                          });
                        },
                      ),
                      TextFormField(
                        validator: (value) {
                          if (value.isEmpty) {
                            return Constants.emptyEmailValidationString;
                          } else if (Utils.isValidEmail(value) == false) {
                            return Constants.invalidEmailValidationString;
                          } else {
                            return null;
                          }
                        },
                        keyboardType:
                            TextInputType.emailAddress, // Email keyboard
                        decoration: InputDecoration(
                            labelText: Constants.emailLabelText),
                        onChanged: (text) {
                          setState(() {
                            pidEmailValue = text;
                          });
                        },
                      ),
                      TextFormField(
                        validator: (value) {
                          if (value.isEmpty) {
                            return Constants.emptyAddress1String;
                          } else {
                            return null;
                          }
                        },
                        decoration: InputDecoration(
                            labelText: Constants.addressOneLabelText),
                        onChanged: (text) {
                          setState(() {
                            pidAddressLine1Value = text;
                          });
                        },
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                          labelText: Constants.addressTwoLabelText,
                        ),
                        onChanged: (text) {
                          setState(() {
                            pidAddressLine2Value = text;
                          });
                        },
                      ),
                      DropDownFormField(
                        titleText: Constants.selectCountryLabelText,
                        hintText: Constants.countryHintString,
                        value: pidSelectCountryValue,
                        onSaved: (value) {
                          setState(() {
                            pidSelectCountryValue = value;
                            pidSelectStateValue = Constants.emptyString;
                          });
                        },
                        onChanged: (value) {
                          setState(() {
                            pidSelectCountryValue = value;
                            pidSelectStateValue = Constants.emptyString;
                          });
                        },
                        dataSource: Constants.countryDetail,
                        textField: 'display',
                        valueField: 'value',
                        validator: (value) {
                          if (value == null) {
                            return Constants.selectCountry;
                          } else if (value.isEmpty) {
                            return Constants.selectCountry;
                          } else {
                            return null;
                          }
                        },
                      ),
                      DropDownFormField(
                        titleText: Constants.selectStateLabelText,
                        hintText: Constants.stateValidationString,
                        value: pidSelectStateValue,
                        onSaved: (value) {
                          setState(() {
                            pidSelectStateValue = value;
                          });
                        },
                        onChanged: (value) {
                          setState(() {
                            pidSelectStateValue = value;
                          });
                        },
                        dataSource:
                            Utils.getStateBasedOnCountry(pidSelectCountryValue),
                        textField: 'display',
                        valueField: 'value',
                        validator: (value) {
                          if (value == null) {
                            return Constants.selectState;
                          } else if (value.isEmpty) {
                            return Constants.selectState;
                          } else {
                            return null;
                          }
                        },
                      ),
                      TextFormField(
                        validator: (value) {
                          if (value.isEmpty) {
                            return Constants.pinValidation;
                          } else {
                            return null;
                          }
                        },
                        keyboardType: TextInputType.number, // Number keyboard
                        decoration: InputDecoration(
                            labelText: Constants.pinCodeLabelText),
                        onChanged: (text) {
                          setState(() {
                            pidPincodevalue = text;
                          });
                        },
                      ),
                      SizedBox(height: 80),
                      Center(
                          child: SizedBox(
                        width: 240,
                        height: 50,
                        child: RaisedButton(
                            child: Text(
                              Constants.submitButtonTitle,
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                            onPressed: () {
                              FocusScope.of(context).requestFocus(FocusNode());
                              if (_feedBackFormKey.currentState.validate()) {
                                // Form data valid show success
                                _scaffoldKey.currentState.showSnackBar(
                                    SnackBar(content: Text('Success')));
                              } else {
                                _scaffoldKey.currentState.showSnackBar(SnackBar(
                                    content: Text(
                                        'Review form for mandatory details required before submit.')));
                              }
                            }),
                      ))
                    ],
                  ),
                ),
              ),
            ),
          ),
        ));
  }
}
