class Raza {
  int id = 0;
  String descripcion = '';
  int? idMascota;
  Mascota? mascota;

  Raza(
      {required this.id,
      required this.descripcion,
      this.idMascota,
      this.mascota});

  Raza.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    descripcion = json['descripción'];
    idMascota = json['idMascota'];
    mascota =
        json['mascota'] != null ? new Mascota.fromJson(json['mascota']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['descripcion'] = this.descripcion;
    data['idMascota'] = this.idMascota;
    if (this.mascota != null) {
      data['mascota'] = this.mascota!.toJson();
    }
    return data;
  }
}

class Mascota {
  int? id;
  String? nombre;
  int? edad;
  String? fechaNacimiento;
  int? idTipoMascota;
  TipoMascota? tipoMascota;

  Mascota(
      {this.id,
      this.nombre,
      this.edad,
      this.fechaNacimiento,
      this.idTipoMascota,
      this.tipoMascota});

  Mascota.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nombre = json['nombre'];
    edad = json['edad'];
    fechaNacimiento = json['fechaNacimiento'];
    idTipoMascota = json['idTipoMascota'];
    tipoMascota = json['tipoMascota'] != null
        ? new TipoMascota.fromJson(json['tipoMascota'])
        : null;
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
