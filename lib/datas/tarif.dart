import 'package:firebase_database/firebase_database.dart';
import 'package:uzmobile/constants/shared_preferences.dart';
import 'package:uzmobile/firebase_arguments.dart';

class Tarif {
  DatabaseReference reference;

  String code;
  String image;
  String tarifText;
  String title;

  void initialize() {
    String tableLanguage = '';
    switch (SharedPrefHelper.chosenLanguage) {
      case 0:
        tableLanguage = 'tarif_uz';
        break;
      case 1:
        tableLanguage = 'tarif_ru';
        break;
      default:
        tableLanguage = 'tarif_en';
        break;
    }

    reference = FirebaseInitialize.database.reference().child(tableLanguage);
  }

  void snapshot(DataSnapshot snapshot) {
    code = snapshot.value['code'];
    image = snapshot.value['image'];
    tarifText = snapshot.value['tarif_text'];
    title = snapshot.value['title'];
  }
}
