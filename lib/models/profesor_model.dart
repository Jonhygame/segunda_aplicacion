class ProfessorModel {
  int? idProfessor;
  String? nameProfessor;
  int? idCareer;
  String? email;

  ProfessorModel(
      {this.idProfessor, this.nameProfessor, this.idCareer, this.email});
  factory ProfessorModel.fromMap(Map<String, dynamic> map) {
    return ProfessorModel(
        idProfessor: map['idProfessor'],
        nameProfessor: map['nameProfessor'],
        idCareer: map['idCareer'],
        email: map['email']);
  }
}
