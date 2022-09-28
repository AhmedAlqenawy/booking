import 'dart:ui';

enum LanguageType { English, Arabic}

const String Arabic = "ar";
const String English = "en";
const String Assets_Localization = "assets/lang";

const Locale Arabic_local = Locale( "ar","SA");
const Locale English_local = Locale("en","US");



extension LanguageExtension on LanguageType{
  String getValue(){
    switch(this){
      case LanguageType.English:
        return English;
      case LanguageType.Arabic:
        return Arabic;
    }
  }

}