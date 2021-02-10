import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefHelper {
  static String shLanguage = 'sharedPrefLanguage';

  static int uzbek = 0;
  static int russian = 1;
  static int english = 2;

  static int chosenLanguage = 0;

  static void changeLanguage(int language) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    chosenLanguage = language ?? 0;
    await preferences.setInt(shLanguage, language);
  }

  static void getLanguage() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    chosenLanguage = preferences.getInt(shLanguage) ?? 0;
  }
}
