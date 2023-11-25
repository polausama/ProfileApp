class User {
   String? uid ;
    String? uname ;
    String? email ;
    String? password ;
    String? cpassword ;
    User();
    User.formap(Map<String,dynamic> map){
      uid = map['userid'];
      uname = map['uname'];
      email = map['email'];
      password = map['password'];
      cpassword = map['cpassword'];

    }
     Map<String,dynamic> toMap(){
      Map<String,dynamic> map = {
        'userid' : uid , 
         'uname' : uname ,
          'email' : email ,
           'password' : password ,
            'cpassword' : cpassword ,
      };
      return map;
    }
}