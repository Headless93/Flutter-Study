
//登录用户项数据转换
class LoginUserModal{
  String uid;//用户ID
  String mobile;//手机号
  String SN_API;//sn
  String realname;//姓名

  LoginUserModal({
    this.uid,
    this.mobile,
    this.SN_API,
    this.realname,
});

  factory LoginUserModal.fromJson(dynamic json){
    return LoginUserModal(
      uid: json['uid'],
      mobile: json['mobile'],
      SN_API: json['SN_API'],
      realname: json['realname'],
    );
  }

}

