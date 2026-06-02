
import 'package:shared_preferences/shared_preferences.dart';

import '../../models/user_model.dart';
import 'pref_keys.dart';

class AppPreferences {

static late SharedPreferences _prefs;

/// INIT
static Future<void> init() async {
_prefs = await SharedPreferences.getInstance();
}

/// ONBOARDING

static bool getSeenOnboarding() {
return _prefs.getBool(
PrefKeys.seenOnboarding,
) ??
false;
}

static Future<void> setSeenOnboarding(
bool value,
) async {
await _prefs.setBool(
PrefKeys.seenOnboarding,
value,
);
}

/// TOKEN

static String getToken() {
return _prefs.getString(
PrefKeys.token,
) ??
'';
}

static Future<void> setToken(
String value,
) async {
await _prefs.setString(
PrefKeys.token,
value,
);
}

/// LOGIN

static bool isLoggedIn() {
return _prefs.getBool(
PrefKeys.isLoggedIn,
) ??
false;
}

static Future<void> setLoggedIn(
bool value,
) async {
await _prefs.setBool(
PrefKeys.isLoggedIn,
value,
);
}

/// USER DATA

static String getName() {
return _prefs.getString(
PrefKeys.name,
) ??
'Ghada';
}

static Future<void> setName(
String value,
) async {
await _prefs.setString(
PrefKeys.name,
value,
);
}

static String getEmail() {
return _prefs.getString(
PrefKeys.email,
) ??
'';
}

static Future<void> setEmail(
String value,
) async {
await _prefs.setString(
PrefKeys.email,
value,
);
}

static String getImagePath() {
return _prefs.getString(
PrefKeys.imagePath,
) ??
'';
}

static Future<void> setImagePath(
String value,
) async {
await _prefs.setString(
PrefKeys.imagePath,
value,
);
}

static String getGender() {
return _prefs.getString(
PrefKeys.gender,
) ??
'Female';
}

static Future<void> setGender(
String value,
) async {
await _prefs.setString(
PrefKeys.gender,
value,
);
}

static int getAge() {
return _prefs.getInt(
PrefKeys.age,
) ??
25;
}

static Future<void> setAge(
int value,
) async {
await _prefs.setInt(
PrefKeys.age,
value,
);
}

static double getHeight() {
return _prefs.getDouble(
PrefKeys.height,
) ??
170.0;
}

static Future<void> setHeight(
double value,
) async {
await _prefs.setDouble(
PrefKeys.height,
value,
);
}

static double getWeight() {
return _prefs.getDouble(
PrefKeys.weight,
) ??
65.0;
}

static Future<void> setWeight(
double value,
) async {
await _prefs.setDouble(
PrefKeys.weight,
value,
);
}

static String getGoal() {
return _prefs.getString(
PrefKeys.goal,
) ??
'Maintain Weight';
}

static Future<void> setGoal(
String value,
) async {
await _prefs.setString(
PrefKeys.goal,
value,
);
}

static String getLifestyle() {
return _prefs.getString(
PrefKeys.lifestyle,
) ??
'Moderately Active';
}

static Future<void> setLifestyle(
String value,
) async {
await _prefs.setString(
PrefKeys.lifestyle,
value,
);
}

/// USER MODEL

static Future<void> saveUser(
UserModel user,
) async {
await setName(user.name);
await setEmail(user.email);
await setImagePath(user.imagePath);

await setGender(user.gender);
await setAge(user.age);
await setHeight(user.height);
await setWeight(user.weight);
await setGoal(user.goal);
await setLifestyle(user.lifestyle);
}

static UserModel getUser() {
return UserModel(
name: getName(),
email: getEmail(),
imagePath: getImagePath(),
gender: getGender(),
age: getAge(),
height: getHeight(),
weight: getWeight(),
goal: getGoal(),
lifestyle: getLifestyle(),
);
}

/// LANGUAGE

static String getLanguageCode() {
return _prefs.getString(
PrefKeys.languageCode,
) ??
'en';
}

static Future<void> setLanguageCode(
String code,
) async {
await _prefs.setString(
PrefKeys.languageCode,
code,
);
}

/// THEME

static bool getTheme() {
return _prefs.getBool(
PrefKeys.theme,
) ??
false;
}

static Future<void> setTheme(
bool value,
) async {
await _prefs.setBool(
PrefKeys.theme,
value,
);
}

/// CLEAR

static Future<void> clear() async {
await _prefs.clear();
}

static Future<void> logout() async {
await _prefs.remove(
PrefKeys.token,
);

await _prefs.setBool(
PrefKeys.isLoggedIn,
false,
);
}
}
