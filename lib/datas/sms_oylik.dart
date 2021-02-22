import 'package:firebase_database/firebase_database.dart';
import 'package:uzmobile/constants/shared_preferences.dart';
import 'package:uzmobile/firebase_arguments.dart';

class SMSOylik {
  DatabaseReference reference;

  String code;
  String money;
  String sms;

  void initialize() {
    String tableLanguage = '';
    switch (SharedPrefHelper.chosenLanguage) {
      case 0:
        tableLanguage = 'sms_oylik_uz';
        break;
      case 1:
        tableLanguage = 'sms_oylik_ru';
        break;
      default:
        tableLanguage = 'sms_oylik_en';
        break;
    }
    reference = FirebaseInitialize.database.reference().child(tableLanguage);
  }

  void snapshot(DataSnapshot snapshot) {
    code = snapshot.value['code'];
    sms = snapshot.value['sms'];
    money = snapshot.value['money'];
  }
}
