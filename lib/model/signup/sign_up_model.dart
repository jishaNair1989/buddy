class SignUpModel {
  String firstName;
  String lastName;
  String email;
  String password;
  String? bYear;
  String? bMonth;
  String? bDay;
  String gender;

  SignUpModel(
      {
         required this.firstName,
         required this.lastName,
         required this.email,
         required this.password,
         this.bYear,
         this.bMonth,
         this.bDay,
         required this.gender,
      });

  Map<String, dynamic>? toJson() => {
    "first_name": firstName,
    "last_name": lastName,
    "email": email,
    "password": password,
    "bYear": bYear,
    "bMonth": bMonth,
    "bDay": bDay,
    "gender": gender,
  };

}
