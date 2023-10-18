class TaskModel {
  int? idTask;
  String? nomTask;
  DateTime? fecExpiracion;
  DateTime? fecRecordatorio;
  String? desTask;
  int? realizada;
  int? idProfessor;

  TaskModel(
      {this.idTask,
      this.nomTask,
      this.fecExpiracion,
      this.fecRecordatorio,
      this.desTask,
      this.realizada,
      this.idProfessor});

  factory TaskModel.fromMap(Map<String, dynamic> map) {
    return TaskModel(
        idTask: map['idTask'],
        nomTask: map['nomTask'],
        fecExpiracion: DateTime.tryParse(map['fecExpiracion'] as String),
        fecRecordatorio: DateTime.tryParse(map['fecRecordatorio'] as String),
        desTask: map['desTask'],
        realizada: map['realizada'],
        idProfessor: map['idProfessor']);
  }
}
