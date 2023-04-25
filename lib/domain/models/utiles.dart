class Mensajes {
  late String mensaje;

  Mensajes({required this.mensaje});

  factory Mensajes.desdeJson(Map<String, dynamic> jsonMap) {
    return Mensajes(mensaje: jsonMap['mensaje']);
  }
  factory Mensajes.desdeJson1(Map<String, dynamic> jsonMap) {
    return Mensajes(mensaje: jsonMap['mensaje']);
  }
  factory Mensajes.desdeJson2(Map<String, dynamic> jsonMap) {
    return Mensajes(mensaje: jsonMap['mensaje']);
  }
  factory Mensajes.desdeJson3(Map<String, dynamic> jsonMap) {
    return Mensajes(mensaje: jsonMap['mensaje']);
  }
}
