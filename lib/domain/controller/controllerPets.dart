import 'package:crud_http/data/services/peticionesPets.dart';
import 'package:crud_http/domain/models/pets.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../models/utiles.dart';

class ControlPets extends GetxController {
  final Rxn<List<Pets>> listaPets = Rxn<List<Pets>>([]);
  final Rxn<List<Mensajes>> _listarMensajes = Rxn<List<Mensajes>>([]);
  final Rxn<List<Mensajes>> _listarMensajes1 = Rxn<List<Mensajes>>([]);
  final Rxn<List<Mensajes>> _listarMensajes2 = Rxn<List<Mensajes>>([]);

  Future<void> listar() async {
    listaPets.value = await PeticionesPets.listar();
  }

  Future<void> crearPets(String foto, String nombre, String raza) async {
    _listarMensajes.value =
        await PeticionesPets.registrarPets(foto, nombre, raza);
  }

  Future<void> eliminar(int id) async {
    _listarMensajes1.value = await PeticionesPets.eliminar(id);
  }

  Future<void> modificar(
      int id, String foto, String nombre, String raza) async {
    _listarMensajes2.value =
        await PeticionesPets.modificar(id, foto, nombre, raza);
  }

  Future<void> getImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.getImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      var foto;
      foto.text = pickedFile.path;
    }
  }

  List<Mensajes>? get listaMensajes2 => _listarMensajes2.value;
  List<Mensajes>? get listaMensajes1 => _listarMensajes1.value;
  List<Mensajes>? get listaMensajes => _listarMensajes.value;
  List<Pets>? get listaPetsFinal => listaPets.value;
}
