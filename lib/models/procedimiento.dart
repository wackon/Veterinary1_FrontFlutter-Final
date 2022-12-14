class Procedimiento {
  int id = 0;
  String nombreProcedimiento = '';

  Procedimiento({required this.id, required this.nombreProcedimiento});

  Procedimiento.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nombreProcedimiento = json['nombreProcedimiento'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['nombreProcedimiento'] = this.nombreProcedimiento;
    return data;
  }
}

/* class Brand {
  int id = 0;
  String description = '';

  Brand({required this.id, required this.description});

  Brand.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['description'] = this.description;
    return data;
  }
} */