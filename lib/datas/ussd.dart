import 'package:firebase_database/firebase_database.dart';
import 'package:uzmobile/constants/shared_preferences.dart';
import 'package:uzmobile/firebase_arguments.dart';

class USSD {
  DatabaseReference ussdRef;

  String code;
  String text;

  void initialize() {
    String tableLanguage = '';
    switch (SharedPrefHelper.chosenLanguage) {
      case 0:
        tableLanguage = 'ussd_uz';
        break;
      case 1:
        tableLanguage = 'ussd_ru';
        break;
      default:
        tableLanguage = 'ussd_en';
        break;
    }
    ussdRef = FirebaseInitialize.database.reference().child(tableLanguage);
  }

  void snapshot(DataSnapshot snapshot) {
    code = snapshot.value['code'];
    text = snapshot.value['text'];
  }
}
