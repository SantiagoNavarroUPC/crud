import 'dart:convert';
import 'package:crud_http/domain/models/pets.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

import '../../domain/models/utiles.dart';

class PeticionesPets {
  static Future<List<Pets>> listar() async {
    var url = Uri.parse(
        "https://proyectoprogramcionmobil.000webhostapp.com/Api-Movil/listar.php");

    final response = await http.get(url);

    print(response.statusCode);
    print(response.body);
    return compute(convertirAlista2, response.body);
  }

  static Future<List<Mensajes>> registrarPets(
      String foto, String nombre, String raza) async {
    var url = Uri.parse(
        "https://proyectoprogramcionmobil.000webhostapp.com/Api-Movil/agregarPets.php");

    final response = await http
        .post(url, body: {'foto': foto, 'nombre': nombre, 'raza': raza});

    print(response.statusCode);
    print(response.body);
    return compute(convertirAlista, response.body);
  }

  static Future<List<Mensajes>> eliminar(int id) async {
    var url = Uri.parse(
        "https://proyectoprogramcionmobil.000webhostapp.com/Api-Movil/deletePets.php");

    final response = await http.post(url, body: {'id': id.toString()});

    print(response.statusCode);
    return compute(convertirAlista3, response.body);
  }

  static Future<List<Mensajes>> modificar(
      int id, String foto, String nombre, String raza) async {
    var url = Uri.parse(
        "https://proyectoprogramcionmobil.000webhostapp.com/Api-Movil/ModificarPets.php");

    final response = await http.post(url, body: {
      'id': id.toString(),
      'foto': foto,
      'nombre': nombre,
      'raza': raza
    });

    print(response.statusCode);
    return compute(convertirAlista4, response.body);
  }

  static List<Mensajes> convertirAlista(String responsebody) {
    final pasar = json.decode(responsebody).cast<Map<String, dynamic>>();
    print(pasar);
    print(pasar[0]['mensaje']);
    return pasar.map<Mensajes>((json) => Mensajes.desdeJson1(json)).toList();
  }

  static List<Mensajes> convertirAlista3(String responsebody) {
    final pasar = json.decode(responsebody).cast<Map<String, dynamic>>();
    print(pasar);
    print(pasar[0]['mensaje']);
    return pasar.map<Mensajes>((json) => Mensajes.desdeJson2(json)).toList();
  }

  static List<Pets> convertirAlista2(String responsebody) {
    final pasar = json.decode(responsebody).cast<Map<String, dynamic>>();
    return pasar.map<Pets>((json) => Pets.desdeJson(json)).toList();
  }

  static List<Mensajes> convertirAlista4(String responsebody) {
    final pasar = json.decode(responsebody).cast<Map<String, dynamic>>();
    print(pasar);
    print(pasar[0]['mensaje']);
    return pasar.map<Mensajes>((json) => Mensajes.desdeJson3(json)).toList();
  }
}
