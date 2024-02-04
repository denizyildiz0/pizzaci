import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class Storage {
  loadUser() async {
    SharedPreferences storage = await SharedPreferences.getInstance();   //loading olma işlemine bagladım bu sayfayı
    var id = storage.getInt("id");
    var email = storage.getString("email");
    var password = storage.getString("password");
    var name = storage.getString("name");

    if (id == null) {
      return null;
    } else {
      return {"id": id, "email": email, "password": password, "name": name};
    }
  }

  saveUser({
    required int id,
    required String email,
    required String password,
    required String name,
  }) async {
    SharedPreferences storage = await SharedPreferences.getInstance();
    storage.setInt("id", id);
    storage.setString("email", email);
    storage.setString("password", password);
    storage.setString("name", name);
  }

  saveToken(String access_token) async {
    final storage = new FlutterSecureStorage();
    await storage.write(key: "access_token", value: access_token);
  }

  loadToken() async {
    final storage = new FlutterSecureStorage();
    var access_token = await storage.read(key: "access_token");
    return access_token;
  }
}
