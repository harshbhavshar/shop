class Customermodel{
  String email;
  String fname;
  String lname;
  String password;
  Customermodel({
    required this.email,
    required this.fname,
    required this.lname,
    required this.password,
});
  Map<String,dynamic> toJson(){
    Map<String,dynamic> map = {};
    map.addAll({
      'email': email,
      'fname' : fname,
      'lname' : lname,
      'password': password,
      'username' : email,
    });
    return map;
  }
}