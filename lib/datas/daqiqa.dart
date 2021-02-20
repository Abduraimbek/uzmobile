import 'package:firebase_database/firebase_database.dart';
import 'package:uzmobile/constants/shared_preferences.dart';
import 'package:uzmobile/firebase_arguments.dart';

class Daqiqa {
  DatabaseReference reference;

  String code;
  String money;
  int time;

  void initialize() {
    String tableLanguage = '';
    switch (SharedPrefHelper.chosenLanguage) {
      case 0:
        tableLanguage = 'daqiqa_uz';
        break;
      case 1:
        tableLanguage = 'daqiqa_ru';
        break;
      default:
        tableLanguage = 'daqiqa_en';
        break;
    }

    reference = FirebaseInitialize.database.reference().child(tableLanguage);
  }

  void snapshot(DataSnapshot snapshot) {
    code = snapshot.value['code'];
    money = snapshot.value['money'];
    time = snapshot.value['time'];
  }
}
