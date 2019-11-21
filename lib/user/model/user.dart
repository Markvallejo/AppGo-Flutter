class User {
  String sIMEI;
  String username;
  String password;
  String concessionaire;
  String sDealerNumber;
  String sSalesManInfo;

  User(
      {this.sIMEI,
      this.username,
      this.password,
      this.concessionaire,
      this.sDealerNumber,
      this.sSalesManInfo});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      // sIMEI: json["3D241B91-847F-462F-A231-FEA51C4D9957"],
      // username: json["TEST003"],
      // password: json["Password00"],
      // concessionaire: json["99998"],

      sIMEI: json['sImei'],
      username: json['username'],
      password: json['password'],
      concessionaire: json['concessionaire'],
      sDealerNumber: json['sDealerNumbre'],
      sSalesManInfo: json['sSalesManInfo'],
    );
  }
}
