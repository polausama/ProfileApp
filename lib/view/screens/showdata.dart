import 'package:flutter/material.dart';
import 'package:flutter_profile_app/model/my_database.dart';
import 'package:flutter_profile_app/model/user.dart';

class ShowData extends StatefulWidget {
  const ShowData({super.key});

  @override
  State<ShowData> createState() => _ShowDataState();
}

class _ShowDataState extends State<ShowData> {
  List<User> users =[];
  late MyDataBase db;
  void getdata()async{
    db.initializeDb();
    List <User> data = await db.getFromDB();
    setState(() {
      users=data;
    });
  }
  @override
  void initState() {
    super.initState();
    db =MyDataBase();
    db.initializeDb();
    getdata();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: users.length,
        itemBuilder: (context, index) {
          return Container(
color: Colors.amber,
child: Padding(
  padding: EdgeInsets.all(15),
  child: Column(
    children: [
      Text(users[index].uid.toString()),
          Text(users[index].uname.toString()),
          Text(users[index].email.toString()),
          Text(users[index].password.toString()),
          Text(users[index].cpassword.toString()),
    ],
  ),
  ),
          );

        },),
    );
  }
}