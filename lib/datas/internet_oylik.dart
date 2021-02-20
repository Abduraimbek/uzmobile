import 'package:firebase_database/firebase_database.dart';
import 'package:uzmobile/constants/shared_preferences.dart';
import 'package:uzmobile/firebase_arguments.dart';

class InternetOylik {
  DatabaseReference reference;

  String code;
  String mb;
  String money;

  void initialize() {
    String tableLanguage = '';
    switch (SharedPrefHelper.chosenLanguage) {
      case 0:
        tableLanguage = 'internet_oylik_uz';
        break;
      case 1:
        tableLanguage = 'internet_oylik_ru';
        break;
      default:
        tableLanguage = 'internet_oylik_en';
        break;
    }
    reference = FirebaseInitialize.database.reference().child(tableLanguage);
  }

  void snapshot(DataSnapshot snapshot) {
    code = snapshot.value['code'];
    mb = snapshot.value['mb'];
    money = snapshot.value['money'];
  }
}
