class Medicamento {
  int id = 0;
  String nombreMedicamento = '';

  Medicamento({required this.id, required this.nombreMedicamento});

  Medicamento.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nombreMedicamento = json['nombreMedicamento'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['nombreMedicamento'] = this.nombreMedicamento;
    return data;
  }
}
