import 'package:firebase_database/firebase_database.dart';
import 'package:uzmobile/firebase_arguments.dart';

class Nomer {
  DatabaseReference reference;

  static String money;
  static String numbers;

  Future<void> initialize(int category) async {
    String numberCategory = '';
    switch (category) {
      case 1:
        numberCategory = 'nomer_1';
        break;
      case 2:
        numberCategory = 'nomer_2';
        break;
      case 3:
        numberCategory = 'nomer_3';
        break;
      case 4:
        numberCategory = 'nomer_4';
        break;
      case 5:
        numberCategory = 'nomer_5';
        break;
      default:
        numberCategory = 'nomer_6';
        break;
    }
    reference = FirebaseInitialize.database.reference().child(numberCategory);

    await reference.once().then((DataSnapshot snapshot) {
      var l = List<dynamic>.from(snapshot.value);
      var map = l[1];
      var moneyVar = map['money'];
      var numbersVar = map['numbers'];
      money = moneyVar.toString();
      numbers = numbersVar.toString();
    });
  }
}
