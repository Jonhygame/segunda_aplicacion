class CareerModel {
  int? idCareer;
  String? nameCareer;

  CareerModel({this.idCareer, this.nameCareer});
  factory CareerModel.fromMap(Map<String, dynamic> map) {
    return CareerModel(
        idCareer: map['idCareer'], nameCareer: map['nameCareer']);
  }
}
