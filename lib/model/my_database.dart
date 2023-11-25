import 'package:flutter_profile_app/model/user.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class MyDataBase {
  Future<Database> initializeDb()async{
    String path = await getDatabasesPath();
    return openDatabase(
      join(path,'userinfo.db'),
      version: 1,
      onCreate: (db, version) {
        db.execute('CREATE TABLE user(userid TEXT, uname TEXT,email TEXT,password TEXT,cpassword TEXT)');
      },
    );
  }
 Future <void> insertUserinDB(User u)async{
    Database db = await initializeDb();
    db.insert('user', u.toMap());
    print('saved sucssfuel');
  }
  Future<List<User>> getFromDB()async{
        Database db = await initializeDb();
      List<Map<String,dynamic>> data =  await db.query('user');
     List<User> users =  data.map((e) {
        User newuser = User.formap(e);
        return newuser;
      }).toList();

return users;
  }
  Future<User?> getLoginUser(String username, String password) async {
Database db = await initializeDb(); 
var res = await db.rawQuery("SELECT * FROM user WHERE "
        "username = '$username' AND "
        "password = '$password'");
  }
}