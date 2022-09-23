class SismosDto {
  String? fecha;
  String? profundidad;
  String? magnitud;
  String? refGeografica;
  String? fechaUpdate;

  SismosDto(
      {this.fecha,
      this.profundidad,
      this.magnitud,
      this.refGeografica,
      this.fechaUpdate});

  SismosDto.fromJson(Map<String, dynamic> json) {
    fecha = json['Fecha'];
    profundidad = json['Profundidad'];
    magnitud = json['Magnitud'];
    refGeografica = json['RefGeografica'];
    fechaUpdate = json['FechaUpdate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['Fecha'] = fecha;
    data['Profundidad'] = profundidad;
    data['Magnitud'] = magnitud;
    data['RefGeografica'] = refGeografica;
    data['FechaUpdate'] = fechaUpdate;
    return data;
  }
}