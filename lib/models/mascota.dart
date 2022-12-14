class Mascota {
  int id=0;
  String nombre ='';
  int? edad;
  String? fechaNacimiento;
  int idTipoMascota=0;
  TipoMascota? tipoMascota;
  int? idRaza;
  Raza? raza;

  Mascota(
      {required this.id,
      required this.nombre,
      this.edad,
      this.fechaNacimiento,
      required this.idTipoMascota,
      this.tipoMascota,
      this.idRaza,
      this.raza});

  Mascota.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nombre = json['nombre'];
    edad = json['edad'];
    fechaNacimiento = json['fechaNacimiento'];
    idTipoMascota = json['idTipoMascota'];
    tipoMascota = json['tipoMascota'] != null
        ? new TipoMascota.fromJson(json['tipoMascota'])
        : null;
    idRaza = json['idRaza'];
    raza = json['raza'] != null ? new Raza.fromJson(json['raza']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['nombre'] = this.nombre;
    data['edad'] = this.edad;
    data['fechaNacimiento'] = this.fechaNacimiento;
    data['idTipoMascota'] = this.idTipoMascota;
    if (this.tipoMascota != null) {
      data['tipoMascota'] = this.tipoMascota!.toJson();
    }
    data['idRaza'] = this.idRaza;
    if (this.raza != null) {
      data['raza'] = this.raza!.toJson();
    }
    return data;
  }
}

class TipoMascota {
  int? id;
  String? descripcion;

  TipoMascota({this.id, this.descripcion});

  TipoMascota.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    descripcion = json['descripcion'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['descripcion'] = this.descripcion;
    return data;
  }
}

class Raza {
  int? id;
  String? descripciN;

  Raza({this.id, this.descripciN});

  Raza.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    descripciN = json['descripción'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['descripción'] = this.descripciN;
    return data;
  }
}
