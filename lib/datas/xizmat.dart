import 'package:firebase_database/firebase_database.dart';
import 'package:uzmobile/constants/shared_preferences.dart';
import 'package:uzmobile/firebase_arguments.dart';

class Xizmat {
  DatabaseReference reference;

  String body;
  String title;

  void initialize() {
    String tableLanguage = '';
    switch (SharedPrefHelper.chosenLanguage) {
      case 0:
        tableLanguage = 'xizmat_uz';
        break;
      case 1:
        tableLanguage = 'xizmat_ru';
        break;
      default:
        tableLanguage = 'xizmat_en';
        break;
    }

    reference = FirebaseInitialize.database.reference().child(tableLanguage);
  }

  void snapshot(DataSnapshot snapshot) {
    body = snapshot.value['body'];
    title = snapshot.value['title'];
  }
}
