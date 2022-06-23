class ModelTalents {
  String? fullName;
  String? email;
  int? phone;
  String? password;
  String? gender;
  List<String>? talents;

  ModelTalents(
      {this.fullName,
        this.email,
        this.phone,
        this.password,
        this.gender,
        this.talents});
  ModelTalents.fromJson(Map<String, dynamic> json) {
    fullName = json['full_namee'];
    email = json['email'];
    phone = json['phone'];
    password = json['password'];
    gender = json['gender'];
    talents = json['talents'];
  }


}