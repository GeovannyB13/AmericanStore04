import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';

// Just for demo
const productDemoImg1 = "https://drive.usercontent.google.com/u/0/uc?id=1s1id1gdoAeolS4pxCtK4sxGySxJY38lW&export=download";
const productDemoImg2 = "https://drive.usercontent.google.com/download?id=1uo1gP5dROMV5KD8PmPm4aoyn44sKLjBy&export=download&authuser=0&confirm=t&uuid=841754dd-0ce5-49de-a7be-617fa712d7d5&at=AEz70l57VpVzoYWFXSm0Hv4jOrME:1742912482908";
const productDemoImg3 = "https://drive.usercontent.google.com/download?id=1-bM_eZQRTCJ0T6kkNVjQ1gfD6GIRxMn8&export=download&authuser=0&confirm=t&uuid=63aa39be-53da-451a-b854-f48bd0d30372&at=AEz70l7tpsBEXc0HSS0vPXrvGdv4:1742912535006";
const productDemoImg4 = "https://drive.usercontent.google.com/download?id=1g-Wb1eonZH2JOxEdqwRBFaqT1qH5tWtl&export=download&authuser=0&confirm=t&uuid=ef0c29fd-0ded-46b8-ae7b-54f63bcbe3b6&at=AEz70l5xbh_-42kjndIuZ1xKC0Fn:1742912614822";
const productDemoImg5 = "https://drive.usercontent.google.com/download?id=1fEiJjNmh2VQlfmN2XMV8Vg8t1OrmYQAs&export=download&authuser=0&confirm=t&uuid=5d717872-b2fe-42f3-947f-3ad5480367f4&at=AEz70l5iJ05mWTwBXq5L6NEk4OTC:1742912669891";
const productDemoImg6 = "https://drive.usercontent.google.com/download?id=1mq3VYG8HxLOsJUIUlOxxy593Ey2G6woi&export=download&authuser=0&confirm=t&uuid=a9b45cf0-471a-4476-8582-560a3bf9bd0b&at=AEz70l7Ig5bzd9jAJLAPLa_grDdw:1742912705582";

// End For demo

const grandisExtendedFont = "Grandis Extended";

// On color 80, 60.... those means opacity

const Color primaryColor = Color(0xFF7B61FF);

const MaterialColor primaryMaterialColor =
    MaterialColor(0xFF9581FF, <int, Color>{
  50: Color(0xFFEFECFF),
  100: Color(0xFFD7D0FF),
  200: Color(0xFFBDB0FF),
  300: Color(0xFFA390FF),
  400: Color(0xFF8F79FF),
  500: Color(0xFF7B61FF),
  600: Color(0xFF7359FF),
  700: Color(0xFF684FFF),
  800: Color(0xFF5E45FF),
  900: Color(0xFF6C56DD),
});

const Color blackColor = Color(0xFF16161E);
const Color blackColor80 = Color(0xFF45454B);
const Color blackColor60 = Color(0xFF737378);
const Color blackColor40 = Color(0xFFA2A2A5);
const Color blackColor20 = Color(0xFFD0D0D2);
const Color blackColor10 = Color(0xFFE8E8E9);
const Color blackColor5 = Color(0xFFF3F3F4);

const Color whiteColor = Colors.white;
const Color whileColor80 = Color(0xFFCCCCCC);
const Color whileColor60 = Color(0xFF999999);
const Color whileColor40 = Color(0xFF666666);
const Color whileColor20 = Color(0xFF333333);
const Color whileColor10 = Color(0xFF191919);
const Color whileColor5 = Color(0xFF0D0D0D);

const Color greyColor = Color(0xFFB8B5C3);
const Color lightGreyColor = Color(0xFFF8F8F9);
const Color darkGreyColor = Color(0xFF1C1C25);
// const Color greyColor80 = Color(0xFFC6C4CF);
// const Color greyColor60 = Color(0xFFD4D3DB);
// const Color greyColor40 = Color(0xFFE3E1E7);
// const Color greyColor20 = Color(0xFFF1F0F3);
// const Color greyColor10 = Color(0xFFF8F8F9);
// const Color greyColor5 = Color(0xFFFBFBFC);

const Color purpleColor = Color(0xFF7B61FF);
const Color successColor = Color(0xFF2ED573);
const Color warningColor = Color(0xFFFFBE21);
const Color errorColor = Color(0xFFEA5B5B);

const double defaultPadding = 16.0;
const double defaultBorderRadious = 12.0;
const Duration defaultDuration = Duration(milliseconds: 300);

final passwordValidator = MultiValidator([
  RequiredValidator(errorText: 'Password is required'),
  MinLengthValidator(8, errorText: 'password must be at least 8 digits long'),
  PatternValidator(r'(?=.*?[#?!@$%^&*-])',
      errorText: 'passwords must have at least one special character')
]);

final emaildValidator = MultiValidator([
  RequiredValidator(errorText: 'Email is required'),
  EmailValidator(errorText: "Enter a valid email address"),
]);

const pasNotMatchErrorText = "passwords do not match";
