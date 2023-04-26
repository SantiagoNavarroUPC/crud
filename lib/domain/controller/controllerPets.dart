import 'package:crud_http/data/services/peticionesPets.dart';
import 'package:crud_http/domain/models/pets.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../models/utiles.dart';

class ControlPets extends GetxController {
  final Rxn<List<Pets>> listaPets = Rxn<List<Pets>>([]);
  final Rxn<List<Pets>> listaPets1 = Rxn<List<Pets>>([]);
  final Rxn<List<Mensajes>> _listarMensajes = Rxn<List<Mensajes>>([]);
  final Rxn<List<Mensajes>> _listarMensajes1 = Rxn<List<Mensajes>>([]);
  final Rxn<List<Mensajes>> _listarMensajes2 = Rxn<List<Mensajes>>([]);

  Future<void> listar() async {
    listaPets.value = await PeticionesPets.listar();
  }

  Future<void> listarU(int iduser) async {
    listaPets1.value = await PeticionesPets.listarU(iduser);
  }

  Future<void> crearPets(
      String foto, String nombre, String raza, int iduser) async {
    _listarMensajes.value =
        await PeticionesPets.registrarPets(foto, nombre, raza, iduser);
  }

  Future<void> eliminar(int id) async {
    _listarMensajes1.value = await PeticionesPets.eliminar(id);
  }

  Future<void> modificar(
      int id, String foto, String nombre, String raza) async {
    _listarMensajes2.value =
        await PeticionesPets.modificar(id, foto, nombre, raza);
  }

  List<Mensajes>? get listaMensajes2 => _listarMensajes2.value;
  List<Mensajes>? get listaMensajes1 => _listarMensajes1.value;
  List<Mensajes>? get listaMensajes => _listarMensajes.value;
  List<Pets>? get listaPetsFinal => listaPets.value;
  List<Pets>? get listaPetsFinal1 => listaPets1.value;
}
